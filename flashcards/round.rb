# frozen_string_literal: true

require_relative 'deck'
require_relative 'guess'

class RoundFinishedError < Exception

end

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card_index = 0
  end

  def current_card
    return nil if @current_card_index >= @deck.cards.count

    @deck.cards[@current_card_index]
  end

  def record_guess(response)
    raise RoundFinishedError if current_card.nil?
    guess = Guess.new(response, current_card)
    @guesses.append(guess)
    @current_card_index += 1
    guess
  end

  def number_correct
    @guesses.inject(0) { |s, g| s + (g.correct? ? 1 : 0) }
  end

  def percent_correct
    number_correct * 100 / @guesses.count
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.count} cards"
    puts "-" * 50

    while current_card != nil do
      puts "This is card number #{@current_card_index + 1} out of #{deck.cards.count}"
      puts "Question: #{current_card.question}"
      guess = record_guess(gets.chomp)
      puts guess.feedback
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.count} for a score of #{percent_correct}%"
  end
end
