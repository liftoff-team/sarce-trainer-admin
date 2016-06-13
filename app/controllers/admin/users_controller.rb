class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rank = Rank.const_get(:RANKS)[@user.rank.to_sym]
  end
end
