# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'deck'

class DeckTest < MiniTest::Unit::TestCase
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_deck_cards
    cards = [Card.new("What is Alerick's spiritual animal?", 'corgi'),
             Card.new("What is Sofitos's spiritual animal?", 'Snail'),
             Card.new('Where is Gary?', 'In the nowhere')]
    assert_equal(cards, Deck.new(cards).cards)
  end

  def test_deck_cards_count
    cards = [Card.new("What is Alerick's spiritual animal?", 'corgi'),
             Card.new("What is Sofitos's spiritual animal?", 'Snail'),
             Card.new('Where is Gary?', 'In the nowhere')]
    assert_equal(cards.count, Deck.new(cards).count)
  end

  def test_update_cards
    cards = [Card.new("What is Alerick's spiritual animal?", 'corgi'),
             Card.new("What is Sofitos's spiritual animal?", 'Snail'),
             Card.new('Where is Gary?', 'In the nowhere')]
    deck = Deck.new(cards)
    cards.append(Card.new('What is love?',"Baby don't hurt me"))
    refute_equal(cards, deck.cards)
  end
end
