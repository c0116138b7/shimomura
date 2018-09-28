class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def index
    @user = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
  	user = User.new(user_params)
  	user.save
  	redirect_to user_path(current_user)
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end



  def screen_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end
