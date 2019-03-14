class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(categoryName)
    @cards.select{ |card| card.category == categoryName }
  end

  def count
    @cards.count
  end

end
