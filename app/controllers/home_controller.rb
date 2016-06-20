class HomeController < ApplicationController
  def index
    home_path = if current_user
                  current_user.is_admin ? questions_path : my_profile_path
                else
                  new_user_session_path
                end
    redirect_to(home_path)
  end
end
