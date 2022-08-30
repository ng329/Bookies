class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # linking book to booking
    @book = Book.find(params[:book_id])
    @booking.book = @book
    @booking.total_price = calculate_total_price(@booking)
    # add current user as renter
    @booking.user = current_user
    if @booking.save
      redirect_to "/profile"
    else
      render 'books/show', status: :unprocessable_entity
    end
  end

  # def change_booking_status
  #   if params[:button] == "pending"
  #     @booking.status = "accepted"
  #   else
  #     @booking.status = "rejected"
  #   end
  # end

  private

  def calculate_total_price(booking)
    rental_length = (booking.rental_end - @booking.rental_start)
    total_price = booking.book.price_per_day * rental_length.to_i
    return '%.2f' % total_price.round(2)
  end

  def booking_params
    params.require(:booking).permit(:rental_start, :rental_end)
  end
end
