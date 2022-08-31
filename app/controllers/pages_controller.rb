class PagesController < ApplicationController
  def home
  end

  def profile
    # @user = current_user
    @book = Book.new()
    # @my_posts = []
    # @user.books.each do |book|
    #   book.bookings.each do |booking|
    #     @my_posts << booking
    #   end
    # end
    @my_rentals = current_user.bookings
  end
end
