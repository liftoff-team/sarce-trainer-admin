class QuestionService
  def initialize(question)
    @question = question
  end

  def find_correct_count
    GivenAnswer.where(question_id: @question.id, is_correct: true).count
  end
end
