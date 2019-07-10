# frozen_string_literal: true

require_relative 'card'

class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    @response == @card.answer
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect.'
  end
end
