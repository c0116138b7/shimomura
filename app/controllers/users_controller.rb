class UsersController < ApplicationController

before_action :authenticate_user!

  def show
  	@user = current_user
    @users = User.find(params[:id])
  	@books = @users.books
  	@book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def edit
  	@user = current_user
  end

  def create
  	user = User.new(user_params)
  	user.save
  	redirect_to user_path(current_user)
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to book_path
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
