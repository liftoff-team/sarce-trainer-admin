class QuestionPresenter
  def initialize(question)
    @question = question
  end

  def last_answers(number)
    GivenAnswer.where(question_id: @question.id).last(number)
  end

  def correct_ratio
    "#{(@question.correct_ratio * 100).to_i} %"
  end

  def like_ratio
    "#{(@question.like_ratio * 100).to_i} %"
  end
end
