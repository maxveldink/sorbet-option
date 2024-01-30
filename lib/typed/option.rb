# typed: strict
# frozen_string_literal: true

require_relative "no_payload_on_none_error"

module Typed
  # A monad representing either a success or a failure. Contains payload and error information as well.
  class Option
    extend T::Sig
    extend T::Helpers
    extend T::Generic

    abstract!
    sealed!

    Payload = type_member(:out)

    sig { abstract.returns(T::Boolean) }
    def some?
    end

    sig { abstract.returns(T::Boolean) }
    def none?
    end

    sig { abstract.returns(Payload) }
    def payload
    end

    sig do
      abstract
        .type_parameters(:Fallback)
        .params(value: T.type_parameter(:Fallback))
        .returns(T.any(Payload, T.type_parameter(:Fallback)))
    end
    def payload_or(value)
    end
  end

  class Some < Option
    extend T::Sig
    extend T::Generic

    Payload = type_member

    sig { override.returns(Payload) }
    attr_reader :payload

    sig do
      type_parameters(:T)
        .params(payload: T.type_parameter(:T))
        .returns(Typed::Some[T.type_parameter(:T)])
    end
    def self.new(payload)
      super(payload)
    end

    sig { params(payload: Payload).void }
    def initialize(payload)
      @payload = payload
      super()
    end

    sig { override.returns(T::Boolean) }
    def some?
      true
    end

    sig { override.returns(T::Boolean) }
    def none?
      false
    end

    sig do
      override
        .type_parameters(:Fallback)
        .params(_value: T.type_parameter(:Fallback))
        .returns(T.any(Payload, T.type_parameter(:Fallback)))
    end
    def payload_or(_value)
      payload
    end
  end

  class None < Option
    extend T::Sig
    extend T::Generic

    Payload = type_member { {fixed: T.noreturn} }

    sig do
      type_parameters(:T)
        .returns(Typed::None)
    end
    def self.new
      super
    end

    sig { override.returns(T::Boolean) }
    def some?
      false
    end

    sig { override.returns(T::Boolean) }
    def none?
      true
    end

    sig { override.returns(T.noreturn) }
    def payload
      raise NoPayloadOnNoneError
    end

    sig do
      override
        .type_parameters(:Fallback)
        .params(value: T.type_parameter(:Fallback))
        .returns(T.any(Payload, T.type_parameter(:Fallback)))
    end
    def payload_or(value)
      value
    end
  end
end
