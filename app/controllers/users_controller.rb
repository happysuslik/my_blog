class UsersController < ApplicationController
	before_action :load_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
	end

	def edit
	end

	def update
		if @user = User.update(user_params)
			redirect_to @user
		else
			render :edit
		end
	end

	def destroy
	end

	private

	def load_user
    @user = User.find(params[:id])
  end

	def user_params
		params.require(:user).permit(:email, :password)
	end

end