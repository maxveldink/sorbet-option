# typed: true
# frozen_string_literal: true

require "test_helper"

class NoneTest < Minitest::Test
  def setup
    @none = Typed::None.new
  end

  def test_it_is_none
    assert_predicate @none, :none?
  end

  def test_it_is_not_some
    refute_predicate @none, :some?
  end

  def test_payload_raise_error
    assert_raises(Typed::NoPayloadOnNoneError) { @none.payload }
  end

  def test_payload_or_returns_fallback
    assert_equal(2, @none.payload_or(2))
  end
end
