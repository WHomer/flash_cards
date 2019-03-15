require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
    @cards_from_file = [["What is 5 + 5?", "10", "STEM"], ["What is Rachel's favorite animal?", "red panda", "Turing Staff"], ["What is Mike's middle name?", "nobody knows", "Turing Staff"],
["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]]
  end

  def test_it_exists
    cards = CardGenerator.new

    assert_instance_of CardGenerator, cards
  end

  def test_it_pulls_cards
    skip
    cards = CardGenerator.new
    actual = cards.load_cards

    assert_equal @cards_from_file, actual
  end

end
