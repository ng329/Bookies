class PagesController < ApplicationController
  def home
  end

  def profile
    # @user = current_user
    if current_user.nil?
      redirect_to "/books"
    else
      @book = Book.new()
      @my_posts = []
      current_user.books.each do |book|
        book.bookings.each do |booking|
          @my_posts << booking
        end
      end
      @my_rentals = current_user.bookings
    end
  end
end
