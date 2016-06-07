class QuestionPresenter
  def initialize(question)
    @question = question
  end

  def last_answers(number)
    GivenAnswer.where(question_id: @question.id).last(number)
  end

  def user_name(answer)
    User.find(answer.user_id).full_name
  end

  def present_correct_ratio
    "#{(@question.correct_ratio * 100).to_i} %"
  end

  def present_like_ratio
    "#{(@question.like_ratio * 100).to_i} %"
  end
end
