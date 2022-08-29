class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy edit update]

  def index
    @books = Book.all
    # @books = Book.where(location: 5)
  end

  def show
    @booking = Booking.new
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
  end

  def edit
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
    params.require(:book).permit(:title, :blurb, :author, :genre, :address, :price_per_day)
  end
end
