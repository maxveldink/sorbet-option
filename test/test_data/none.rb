# typed: strict
# frozen_string_literal: true

class TestGenerics
  extend T::Sig

  sig { params(should_be_some: T::Boolean).returns(Typed::Option[Integer]) }
  def test_generic_initializer(should_be_some)
    if should_be_some
      Typed::Some.new(1)
    else
      Typed::None.new
    end
  end

  sig { void }
  def test_payload_or
    none = Typed::None.new

    none.payload_or(1).upcase
  end
end
