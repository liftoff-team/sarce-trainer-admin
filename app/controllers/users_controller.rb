class UsersController < ApplicationController
  def index
    @users = User.all

    unless current_user.is_admin?
      redirect_to root_path, notice: "You're not allowed to access
                                    this area: get out!"
    end
  end

  def show
    @user = User.find(params[:id])
    @rank = Rank.const_get(:RANKS)[@user.rank.to_sym]
  end
end
