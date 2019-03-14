require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists

    assert_instance_of Round, @round
  end

  def test_turns_for_empty_array

    assert_equal [], @round.turns
  end

  def test_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_take_new_turn
    new_turn = @round.take_turn("Juneau")

    assert_equal @card_1, new_turn.card
    assert_equal "Juneau", new_turn.guess
    assert_equal Turn, new_turn.class
    assert new_turn.correct?
  end

  def test_round_take_turn
    @round.take_turn("Juneau")

    assert_equal @card_1, @round.turns[0].card
    assert_equal "Juneau", @round.turns[0].guess
    assert_equal 1, @round.number_correct
    assert_equal @card_2, @round.current_card
  end

  def test_round_take_second_turn
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal "Venus", @round.turns[-1].guess
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
    assert_equal @card_3, @round.current_card
  end

  def test_percentage_correct_after_multiple_rounds
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
