class BooksController < ApplicationController
  before_filter :require_login, only: [ :new, :create ]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.reader_id = session[:reader_id]
    if @book.save
      redirect_to books_path, notice: "You added new book into your library"
    else
      flash.now[:error] = "Book without a title is pretty useless"
      render :new
    end
  end

  def show
    begin
      @book = Book.find(params[:id])
    rescue
      flash[:error] = "Book doesn't exist"
      redirect_to root_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    raise AccessDenied unless @book.owned_by?(current_user)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to books_path, notice: "Book has been updated"
    else
      flash.now[:error] = "Please, provide title for the book"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    raise AccessDenied unless book.owned_by?(current_user)
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :pages, :description, :cover)
  end
  
  def require_login
    raise AccessDenied unless session[:reader_id]
  end
end
