class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rank = Rank.const_get(:RANKS)[@user.rank.to_sym]
  end
end
