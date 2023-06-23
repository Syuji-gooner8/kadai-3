class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = (current_user.id)
    @book.save
    redirect_to books_path(@book.id)
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end




private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end