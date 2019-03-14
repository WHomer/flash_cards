class Round
  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @percent_correct = 0.0
  end

  #curret_card - store the current card
  def current_card
    @deck.cards.shift
  end

  #stores and passes in the guess
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns.push(new_turn)
    if new_turn.correct?
      @number_correct += 1
    else

    end
    new_turn
  end

  def percent_correct
    @percent_correct = (@number_correct.to_f / @turns.length) * 100
  end

  def number_correct_by_category(category_name)
    correct = 0
    @turns.each do |each_turn|
      card = each_turn.card
      if card.category == category_name && each_turn.correct?
        correct += 1
      end
    end
    correct
  end

  def percent_correct_by_category(category_name)
    correct = 0.0
    total = 0.0
    @turns.each do |each_turn|
      card = each_turn.card
      if card.category == category_name
        if each_turn.correct?
          correct += 1.0
        end
        total += 1.0
      end
    end
    (correct / total) * 100
  end

end
