class BooksController < ApplicationController
  def index
    @books = Book.all
    # @books = Book.where(location: 5)
  end

  def show

  end
end
