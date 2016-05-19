class RegistrationsController < Devise::RegistrationsController
  before_action :load_ranks, only: %i(new edit)

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

  def load_ranks
    @ranks = Rank.const_get(:RANKS)
  end
end
