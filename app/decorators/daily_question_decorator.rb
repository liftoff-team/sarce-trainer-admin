class DailyQuestionDecorator < Drape::Decorator

  delegate_all

  def question_body
    model.question.body
  end
end
