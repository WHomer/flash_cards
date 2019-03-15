require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
  end

  def test_it_exists
    deck = Deck.new(@cards)

    assert_instance_of Deck, deck
  end

  #number of cards
  def test_number_cards_in_deck
    deck = Deck.new(@cards)

    assert_equal 3, deck.count
  end

  #cards in category :STEM
  def test_category_stem
    deck = Deck.new(@cards)

    assert_equal 2, deck.cards_in_category(:STEM).count
  end

  #cards in category :Geography
  def test_category_geography
    deck = Deck.new(@cards)

    assert_equal 1, deck.cards_in_category(:Geography).count
  end

  #cards in category "Pop Culture"
  def test_category_pop_culture
    deck = Deck.new(@cards)

    assert_equal 0, deck.cards_in_category("Pop Culture").count
  end

end
