class BooksController < ApplicationController
  def index
    @book = Book.new
    @book = Book.all
  end
  
  def create
    @book = Book.new(book_params)#データを新規登録するためのインスタンス作成 
    @book.save
    redirect_to '/top'
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end