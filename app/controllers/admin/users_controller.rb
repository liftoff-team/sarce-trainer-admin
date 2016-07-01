class Admin::UsersController < AdminController
  before_action :assign_user, only: %i(show edit update)
  def index
    @users = User.all
  end

  def show
    @rank = Rank.const_get(:RANKS)[@user.rank.to_sym]
  end

  def edit
    @ranks = Rank.const_get(:RANKS)
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id),
                  notice: 'The user was updated successfully!'
    else
      @ranks = Rank.const_get(:RANKS)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :cis, :rank, :email,
                                 :password, :password_confirmation,
                                 :current_password, :is_admin)
  end

  def assign_user
    @user = User.find(params[:id])
  end
end
