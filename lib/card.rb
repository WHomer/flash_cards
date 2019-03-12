# question
# answer
# category

class Card
  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

  def new(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end

end
