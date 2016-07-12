class MyProfilesController < ApplicationController
  def show
    @me = current_user
    @rank = Rank.const_get(:RANKS)[@me.rank.to_sym]
    @questions = Question.all
    @user = User.find_by_id(params[:id])
    @given_answer = GivenAnswer.where(user_id: @user).limit(10)
  end

end
