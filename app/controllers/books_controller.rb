class BooksController < ApplicationController
   def index
     @book = Book.new
     @books = Book.all
     @user = current_user
   end
  
   def create
     @book = Book.new(book_params)#データを新規登録するためのインスタンス作成 
     @book.user = current_user #本のユーザーと現在のユーザーの関係性
     @book.save
     redirect_to book_path(@book.id)
   end
  
   def show
    @book = Book.find(params[:id])
    @user = @book.user
   end
  
   def edit
     @book = Book.find(params[:id])
   end
  
   def update
     @book = Book.find(params[:id])
     @book.update(book_params)
     redirect_to book_path(@book.id)
   end
  
   def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
   end

  
   private
  
   def book_params
     params.require(:book).permit(:title, :body)
   end
  
end