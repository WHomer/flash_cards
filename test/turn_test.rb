require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_it_exists
    turn = Turn.new("Juneau", @card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", @card)

    assert_equal "Juneau", turn.guess
  end

  def test_card_has_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_card_has_answer
    assert_equal "Juneau", @card.answer
  end

  def test_it_is_correct
    turn = Turn.new("Juneau", @card)

    assert_equal true, turn.correct?
  end

  def test_it_is_not_correct
    turn = Turn.new("Junea", @card)

    assert_equal false, turn.correct?
  end

  def test_it_is_correct_feedback
    turn = Turn.new("Juneau", @card)

    assert_equal "Correct!", turn.feedback
  end

  def test_it_is_not_correct_feedback
    turn = Turn.new("Chicago", @card)

    assert_equal "Incorrect.", turn.feedback
  end

end
