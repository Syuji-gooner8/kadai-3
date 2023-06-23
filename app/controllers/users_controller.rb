class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end

  def index
    @users =User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

end
