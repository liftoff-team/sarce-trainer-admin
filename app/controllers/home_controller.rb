class HomeController < ApplicationController
  def index
    if current_user
      if current_user.is_admin
        redirect_to questions_path
      else
        redirect_to my_profile_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
