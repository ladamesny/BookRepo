class BooksController < ApplicationController

  def index
    @book = Book.new
  end


  def add
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was created"
      redirect_to :action => 'index'
    else
      render :index
    end
  end

  def search
    @title = params[:bookTitle].downcase
  end

  private

  def book_params
    params.require(:book).permit(:access_no, :title, :edition, :publisher)
  end

end
