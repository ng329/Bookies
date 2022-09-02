class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # linking book to booking
    @book = Book.find(params[:book_id])
    @booking.book = @book
    @booking.total_price = calculate_total_price(@booking)
    # add current user as renter
    @booking.user = current_user
    all_recommended = Book.search_genre(@book.genre)
    @recommended = []
    all_recommended.each { |book| @recommended << book unless book == @book }
    if @booking.save
      redirect_to "/profile"
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  def change_booking_status
    booking = Booking.find(params[:id])
    if params[:status] == "accepted"
      booking.status = "accepted"
    else
      booking.status = "rejected"
    end
    booking.save
    redirect_to "/profile"
  end

  private

  def calculate_total_price(booking)
    rental_length = (booking.rental_end - @booking.rental_start)
    total_price = booking.book.price_per_day * rental_length.to_i
    return '%.2f' % total_price.round(2)
  end

  def booking_params
    params.require(:booking).permit(:rental_start, :rental_end)
  end

  def recommended
  end
end
