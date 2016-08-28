class UserController < ApplicationController
	def new
    @user = User.new
	end

	def create
    user = User.new user_params
    if user.save
      flash[:succes] = 'You have registered successfuly'
      login_with_new_user
      redirect_to user_show_path
    else
      flash[:error] = 'An error occurred. Please try again.'
      render :new
    end
    redirect_to show_user_path
	end

	def show
    @user = current_user
	end

  private

  def user_params
    params.require(:user).permit( :first_name, :last_name, :nickname, 
      :gender, :email, :password )
  end

  def login_with_new_user
    session[:user_id] = @user.id
  end
end