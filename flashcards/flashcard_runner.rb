require_relative 'round'

cards = [
  Card.new("What is Alerick's spiritual animal?", 'Corgi'),
  Card.new("What is Sofitos's spiritual animal?", 'Snail'),
  Card.new('Where is Gary?', 'In the nowhere')
]

deck = Deck.new(cards)

round = Round.new(deck)
round.start