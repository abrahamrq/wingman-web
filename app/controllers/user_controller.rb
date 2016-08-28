class UserController < ApplicationController
	def new
    @user = User.new
	end

	def create
    @user = User.new user_params
    if @user.save
      flash[:succes] = 'You have registered successfuly'
      login_with_new_user
      redirect_to show_user_path
    else
      flash[:error] = 'An error occurred. Please try again.'
      render :new
    end
	end

	def show
    @user = current_user
	end

  def update
    @user = current_user
    interest_ids = params[:user][:interest_ids].delete_if {|id| id.blank?}
    if @user.edit_interests(interest_ids)
      flash[:succes] = 'You edited your interests'
      login_with_new_user
      redirect_to dateplan_path
    else
      flash[:error] = 'An error occurred. Please try again.'
      render :show
    end
  end

  def favorites
    @user = current_user
    @favorites = Dateplan.where(user_id: current_user.id)
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