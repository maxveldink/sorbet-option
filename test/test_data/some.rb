# typed: true
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

  sig { returns(Typed::Some[Integer]) }
  def test_inferred_payload_type
    some = Typed::Some.new(1)

    T.assert_type!(some.payload, Integer)
    some
  end

  sig { returns(Typed::Some[Integer]) }
  def test_explicit_payload_type
    Typed::Some[Integer].new("success")
  end

  sig { void }
  def test_payload_or
    some = Typed::Some.new("success")

    some.payload_or(1).upcase
  end
end
