require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

cards = CardGenerator.new

deck = Deck.new(cards.load_cards)
round = Round.new(deck)

round.start
