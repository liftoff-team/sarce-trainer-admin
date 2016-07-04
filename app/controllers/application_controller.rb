class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, prepend: true
   #set authenticate_user before  protect_from_forgery, your request will
   #result in "Can't verify CSRF token authenticity."To resolve this,
   #either change the order in which you call them, or
   #use protect_from_forgery prepend: true
end
