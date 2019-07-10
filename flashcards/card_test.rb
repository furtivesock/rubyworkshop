require 'minitest/autorun'
require_relative 'card'

class CardTest < MiniTest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_question_card
    expected_question = "Is Alerick gay ?"
    actual_question = Card.new(expected_question,"yes").question
    assert_equal(expected_question, actual_question, "Not noice")
  end

  def test_answer_card
    expected_answer = "corgi"
    actual_answer = Card.new("What is Alerick's spiritual animal ?", expected_answer).answer
    assert_equal(expected_answer, actual_answer, "Not noice")
  end
end