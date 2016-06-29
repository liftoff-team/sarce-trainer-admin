class QuestionDecorator < Draper::Decorator
  delegate_all

  def last_answers(number)
    GivenAnswer.where(question_id: model.id).last(number)
  end

  def user_name(given_answer)
    User.find(given_answer.user_id).full_name
  end

  def present_correct_ratio(question)
    "#{(question.correct_ratio * 100).to_i} %"
  end

  def present_like_ratio(question)
    "#{(question.like_ratio * 100).to_i} %"
  end

  def present_given_answers(given_answer)
    given_answer.answers.join(', ')
  end

  def present_is_correct(given_answer)
    given_answer.is_correct ? 'Vrai' : 'Faux'
  end

  def present_answers(question)
    question.answers.join(' ')
  end

  def answer_correct?(question, index)
    question.correct_answers.include?(question.answers[index])
  end
end
