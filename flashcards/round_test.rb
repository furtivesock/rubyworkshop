# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'round'

class RoundTest < MiniTest::Unit::TestCase
  def setup
    @question_1 = 'What is the capital of Alaska?'
    @question_2 = 'Approximately how many miles are in one astronomical unit?'
    @answer_1 = 'Juneau'
    @answer_2 = '93,000,000'
    @card_1 = Card.new(@question_1, @answer_1)
    @card_2 = Card.new(@question_2, @answer_2)
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def teardown
    # Do nothing
  end

  def test_round_deck
    assert_equal(@round.deck, @deck)
  end

  def test_round_empty_guesses
    assert_empty(@round.guesses)
  end

  def test_round_current_card
    assert_equal(@round.current_card, @card_1)
  end

  def test_round_record_guess
    response = 'Juneau'
    guess = @round.record_guess(response)
    assert_equal(response, guess.response)
    assert_equal(@card_1, guess.card)
  end

  def test_round_guesses_count
    @round.record_guess('a')
    @round.record_guess('b')
    assert_equal(2, @round.guesses.count)
  end

  def test_round_guesses_first
    guess_1 = @round.record_guess('a')
    guess_2 = @round.record_guess('b')
    assert_equal(guess_1, @round.guesses.first)
  end

  def test_round_guesses_last
    guess_1 = @round.record_guess('a')
    guess_2 = @round.record_guess('b')
    assert_equal(guess_2, @round.guesses.last)
  end

  def test_round_number_correct
    @round.record_guess('Juneau')
    @round.record_guess('b')
    assert_equal(1, @round.number_correct)
  end

  def test_round_number_correct_next_card
    assert_equal(@card_1, @round.current_card)
    @round.record_guess('Juneau')
    assert_equal(@card_2, @round.current_card)
  end

  def test_round_end_current_card_is_nil
    @round.record_guess('Juneau')
    @round.record_guess('b')
    assert_nil(@round.current_card)
  end

  def test_round_percent_correct
    @round.record_guess('Juneau')
    @round.record_guess('b')
    assert_equal(50, @round.percent_correct)
  end

  def test_round_end_error_guess
    assert_raises(RoundFinishedError) do
      @round.record_guess('a')
      @round.record_guess('b')
      @round.record_guess('c')
    end
  end

end
