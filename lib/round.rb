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
    end
    new_turn
  end

  def percent_correct
    @percent_correct = (@number_correct.to_f / @turns.length) * 100
    @percent_correct.round(1)
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

  def start
    @total_cards_in_deck = @deck.cards.length
    puts "Welcome! You're playing with #{@total_cards_in_deck} cards."
    puts "-------------------------------------------------"
    next_question_prompt
  end

  def next_question_prompt
    while @deck.cards.length > 0
      current_card_position = @total_cards_in_deck - @deck.cards.length + 1
      puts "This is card number #{current_card_position} out of #{@total_cards_in_deck}."
      puts "Question: #{@deck.cards[0].question}"
      user_guess = gets.chomp
      take_turn(user_guess)
      puts @turns.last.feedback
    end
  end_prompt
  end

  def end_prompt
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{@total_cards_in_deck} for a total score of #{percent_correct}%."

    categories_array = []
    @turns.each do |each_turn|
      card = each_turn.card
      categories_array.push(card.category)
    end

    categories_array.uniq!

    categories_array.each do |category|
      category_percentage = percent_correct_by_category(category)
      puts "#{category} - #{category_percentage} correct"
    end
  end

end
