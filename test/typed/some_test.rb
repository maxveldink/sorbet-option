# typed: true
# frozen_string_literal: true

require "test_helper"

class SomeTest < Minitest::Test
  def setup
    @some = Typed::Some.new("Testing")
  end

  def test_it_is_some
    assert_predicate @some, :some?
  end

  def test_it_is_not_none
    refute_predicate @some, :none?
  end

  def test_payload_returns_payload
    assert_equal "Testing", @some.payload
  end

  def test_payload_or_returns_payload
    assert_equal("Testing", @some.payload_or(2))
  end
end
