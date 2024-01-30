# typed: strict
# frozen_string_literal: true

module Typed
  # Error when user attempts to access payload from a None Option.
  class NoPayloadOnNoneError < StandardError
    extend T::Sig

    sig { void }
    def initialize
      super("Attempted to access `payload` from a None Option. You were probably expecting a Some Option. Check the option with `#some?` or `#none?` before attempting to access `payload`.") # rubocop:disable Layout/LineLength
    end
  end
end
