class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :session_on?, :current_user

  def session_on?
    return true if session[:user]
    false
  end

  def current_user
    @user = User.find_by_email(session[:user]) if session_on?
  end
end