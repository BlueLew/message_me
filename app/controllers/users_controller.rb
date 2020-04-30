class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	# before_action :require_admin, only: [:destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "Welcome to Message Me #{@user.username}!"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully."
			redirect_to root_path
		else
			flash[:negative] = "Your account was not updated."
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:negative] = "User has been deleted"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:user).permit(:username, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user
			flash[:negative] = "You can only edit your own account."
			redirect_to root_path
		end
	end

	# def require_admin
	# 	if logged_in? && !current_user.admin?
	# 		flash[:negative] = "Only admin users can perform this action"
	# 		redirect_to root_path
	# 	end
	# end
end
