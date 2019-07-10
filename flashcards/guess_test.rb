# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'guess'

class GuessTest < MiniTest::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_guess_card
    expected_card = Card.new("What is Alerick's spiritual animal ?", 'corgi')
    actual_card = Guess.new('corgi', expected_card).card
    assert_equal(expected_card, actual_card, 'Oh no')
  end

  def test_guess_response
    expected_response = 'golden retriever'
    actual_response = Guess.new(expected_response, Card.new('What is Alerick\'s spiritual animal ?', 'corgi')).response
    assert_equal(expected_response, actual_response, 'Oh no')
  end

  def test_guess_right
    assert(Guess.new('corgi', Card.new('What is Alerick\'s spiritual animal ?', 'corgi')).correct?, 'Oh no')
  end

  def test_guess_wrong
    refute(Guess.new('golden retriever', Card.new('What is Alerick\'s spiritual animal ?', 'corgi')).correct?, 'Oh no')
  end

  def test_right_feedback
    assert_equal('Correct!', Guess.new('corgi', Card.new('What is Alerick\'s spiritual animal ?', 'corgi')).feedback, 'Oh no')
  end

  def test_wrong_feedback
    assert_equal('Incorrect.', Guess.new('golden retriever', Card.new('What is Alerick\'s spiritual animal ?', 'corgi')).feedback, 'Oh no')
  end
end
