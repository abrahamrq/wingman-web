class SessionsController < ApplicationController
  def new
  end

  def create
    return wrong_login unless user
    hash = BCrypt::Engine.hash_secret(password, user.password_salt)
    if user.password_hash == hash
      session[:user_id] = user.id
      redirect_to show_user_path
    else
      wrong_login
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def wrong_login
    flash[:error] = 'Wrong email, username or password, try again'
    redirect_to root_path
  end

  def user
    @user ||= User.find_by_email(email)
  end

  def email
    params[:sessions][:email]
  end

  def password
    params[:sessions][:password]
  end
end