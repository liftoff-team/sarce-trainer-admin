class UserService
  def initialize(user:)
    @user = user
  end

  # Update user with or without password depending on params
  def smart_update(request_params)
    user_params = request_params[:user]
    if user_params[:password].blank?
        user_params.delete('password')
        user_params.delete('password_confirmation')
    end

    unless user.update(user_params)
      raise Sarce::PasswordMismatchException
    end

    user
  end

  private

  attr_accessor :user
end
