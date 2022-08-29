class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # linking book to booking
    @book = Book.find(params[:book_id])
    @booking.book = @book
    # total price dependent on rental length
    rental_length = (@booking.rental_end - @booking.rental_start) * 86400
    @booking.total_price = @book.price_per_day * rental_length
    # add current user as renter
    @booking.user = current_user
    if @booking.save
      # redirect_to "./views/pages/profile_page.html.erb"
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

  def booking_params
    params.require(:booking).permit(:rental_start, :rental_end)
  end
end
