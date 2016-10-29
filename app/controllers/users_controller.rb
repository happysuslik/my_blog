class UsersController < ApplicationController
	load_and_authorize_resource param_method: :user_params
	before_action :load_user, only: [:edit, :destroy]
	before_filter :authenticate_user!

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
	end

	def edit
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	private

	def load_user
    @user = User.find(params[:id])
  end

	def user_params
		params.require(:user).permit(:email, :password)
	end

end