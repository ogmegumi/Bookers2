class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @user = current_user
    @book = Book.new(book_params)#データを新規登録するためのインスタンス作成 
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
   @user = current_user
   @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end