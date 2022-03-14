class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index 
    @books = Book.all
  end

  def new
    @book = Book.new()
  end

  def create 
    @book = Book.new(params.require(:book).permit(:title, :description))
    @book.save
    if @book.save
      flash[:notice] = "Book was saved successfully"
      redirect_to @book
    else
      render 'new'
    end
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :description))
      flash[:message] = "Update Successful"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    byebug
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
end
