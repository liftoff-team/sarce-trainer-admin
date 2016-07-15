class UserDecorator < Drape::Decorator
  delegate_all

  def answered_counter
    GivenAnswer.where(user_id: model.id).count
  end
end
