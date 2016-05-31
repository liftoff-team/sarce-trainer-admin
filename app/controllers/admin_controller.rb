class AdminController < ApplicationController
  before_action :is_admin?

  protected

  def is_admin?
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: "You're not allowed to access
                                      this area: get out!"
    end
  end
end
