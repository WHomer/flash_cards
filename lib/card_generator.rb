require './lib/card'

class CardGenerator

  def initialize
    @filename = 'cards.txt'
    @cards_array = []
  end

  def load_cards
    File.readlines(@filename).map do |line|
      card_line = line.chomp.split(",")

      question = card_line[0]
      answer = card_line[1]
      category = card_line[2]
      card = Card.new(question, answer, category)

      @cards_array.push(card)
    end
    @cards_array
  end

end
