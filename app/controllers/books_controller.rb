class BooksController < ApplicationController
   def index
     @book = Book.new
     @books = Book.all
     @user = current_user
   end
  
   def create
     @book = Book.new(book_params)#データを新規登録するためのインスタンス作成 
     @book.user = current_user #本のユーザーと現在のユーザーの関係性
     if @book.save
        redirect_to book_path(@book.id)
        flash[:notice] = "You have created book successfully."
     else
        @books = Book.all
        @user = current_user
        render 'index'
     end
   end
  
   def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
   end
  
   def edit
     @book = Book.find(params[:id])
     if @book.user == current_user
        render 'edit'
     else
        redirect_to books_path
     end
   end
  
   def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to book_path(@book.id)
     else
        render 'edit'
     end
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