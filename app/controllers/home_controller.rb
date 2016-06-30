class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    return redirect_to(new_user_session_path) unless current_user
    redirect_to(current_user.is_admin ? questions_path : my_profile_path)
  end
end
