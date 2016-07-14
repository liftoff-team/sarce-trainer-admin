class UserService
  def initialize(user)
    @user = user
  end

  # Update user with or without password depending on params
  def smart_update(request_params)
    if request_params[:user][:password].blank?
        request_params[:user].delete('password')
        request_params[:user].delete('password_confirmation')
    end
    @user.update(request_params[:user])
    @user[:user]
  end
end
