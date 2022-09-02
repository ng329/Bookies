class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy update]

  def index
    if params[:query].present?
      @books = Book.search_book(params[:query])
    else
      @books = user_signed_in? ? Book.where.not(user_id: current_user) : Book.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user = @user
    if @book.save
      redirect_to book_path(@book)
    else
      render "pages/profile", status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  def update
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :blurb, :author, :genre, :address, :price_per_day, :photo)
  end
end
