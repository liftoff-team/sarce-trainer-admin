class RegistrationsController < Devise::RegistrationsController
  before_action :load_ranks, only: %i(new create edit update)


  def update
    user_service = UserService.new(user: @user)
    if user_service.smart_update(user_params)
      redirect_to admin_user_path(@user.id)

    else
      render :edit
    end
  rescue Sarce::PasswordMismatchException => e
    flash[:alert] = user_service.errors.full_messages
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :cis, :rank, :email,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :cis, :rank, :email,
                                 :password, :password_confirmation)
  end

  def after_update_path_for(resource)
    my_profile_path
  end

  def load_ranks
    @ranks = Rank.const_get(:RANKS)
  end
end
