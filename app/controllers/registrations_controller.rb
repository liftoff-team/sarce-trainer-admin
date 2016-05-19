class RegistrationsController < Devise::RegistrationsController

  def new
    @ranks = Rank.const_get(:RANKS)
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :cis, :rank, :email,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :cis, :rank, :email,
                                 :password, :password_confirmation,
                                 :current_password)
  end
end
