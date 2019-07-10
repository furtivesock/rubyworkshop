require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards.clone
  end

  def count
    @cards.count
  end
end