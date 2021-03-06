require 'net/http'
require 'json'

class AdapterFromAPI

  def read_data
    final_questions = []
    uri = URI('https://opentdb.com/api.php?amount=1')
    response = Net::HTTP.get_response(uri)
    results = JSON.parse(response.body)
    questions = results['results']
    questions.each do |record|
      question = record['question']
      answer = record['correct_answer']
      category = record['category']
      final_questions.push([question,answer,category])
    end
    final_questions
  end
end
