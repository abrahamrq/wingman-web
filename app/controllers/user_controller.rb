class UserController < ApplicationController
	def new
	end

	def create
		redirect_to show_user_path
	end

	def show
	end
end