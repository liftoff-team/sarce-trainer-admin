class MyProfilesController < ApplicationController
  def show
    @me = current_user
    @rank = Rank.const_get(:RANKS)[@me.rank.to_sym]
    @users = User.all.decorate
    @given_answers = GivenAnswer.where(user_id: @me.id).limit(10)
  end

end
