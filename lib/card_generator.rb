require './lib/card'
require './adapters/from_text'
require './adapters/from_csv'
require './adapters/from_api'

class CardGenerator

  def initialize
    @cards_array = []
    @text_adapter = AdapterFromText.new.read_file
    @csv_adapter = AdapterFromCSV.new.read_file
    @api_adapter = AdapterFromAPI.new.read_data
  end

  def load_cards
    contents = @api_adapter
    contents.each do |content|

      question = content[0]
      answer = content[1]
      category = content[2]
      card = Card.new(question, answer, category)

      @cards_array.push(card)
    end
    @cards_array
  end

end
