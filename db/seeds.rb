# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "creating 20 books"

20.times do
  file = URI.open("https://source.unsplash.com/random/?book,cover")

  title = Faker::Book.title
  blurb = Faker::Books::Dune.quote
  author = Faker::Book.author
  genre = Faker::Book.genre
  address = Faker::Address.full_address
  price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
  user = User.all[0]

  book = Book.new(
    title:,
    blurb:,
    author:,
    genre:,
    address:,
    price_per_day: price
  )

  book.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

  book.user = user
  book.save
end
puts "finished"
