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

  sig { void }
  def test_flow
    option = test_generic_initializer(true)

    if option.some?
      T.assert_type!(option.payload, Integer)
    end
  end

  sig { void }
  def test_case
    option = test_generic_initializer(true)

    case option
    when Typed::Some
      T.assert_type!(option.payload, Integer)
    when Typed::None
      puts "Do nothing"
    else
      T.absurd(option)
    end
  end
end
