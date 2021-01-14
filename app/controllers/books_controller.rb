class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
def book_params
  params.permit(:title, :body)
end

end
