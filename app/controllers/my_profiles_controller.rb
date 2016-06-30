class MyProfilesController < ApplicationController
  def show
    @me = current_user
    @rank = Rank.const_get(:RANKS)[@me.rank.to_sym]
  end
end
