class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_current_user, {only: [:edit,:update,:destroy]}
 #before_action :is_matching_login_user


  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = (current_user.id)
    if @book.save
      flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:notice] = "error"
      render :index
    end
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:notice]= "error"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

private

  def ensure_current_user
      @book = Book.find(params[:id])
     if @book.user_id != current_user.id
        redirect_to books_path
     end
  end




  def book_params
    params.require(:book).permit(:title, :body)
  end
end