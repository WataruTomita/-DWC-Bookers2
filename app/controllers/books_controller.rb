class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      # できればrenderに直したい･･･恐らくそうしないとerror messageは表示できない
      render action: :index
      # redirect_to books_path
    end
  end

  def index
    # @books = Book.page(params[:page])
    @books = Book.all
    @book = Book.new
    # kaminari 動作用 削除しないこと↓
    # @books = Book.page(params[:page])
    # @books = @books.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    # @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
    # 修正作業中
    # params.require(:book).permit(:title, :body) で投稿＆編集は可能
    # ただし/users/:idからの新規投稿はエラー
    params.require(:book).permit(:title, :body)
  end
end