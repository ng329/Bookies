# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
require 'json'
require 'rest-client'

Book.destroy_all
User.destroy_all

puts "creating users"
user1 = User.new(
  first_name: "George",
  last_name: "Smith",
  email: "g.smith@gmail.com",
  password: "password",
  password_confirmation: "password",
  about: "Books are the best escape"
)
file = URI.open("https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
user1.photo.attach(io: file, filename: "profile_pic.jpg", content_type: "image/jpeg")
user1.save

user2 = User.new(
  first_name: "Tim",
  last_name: "Kono",
  email: "t.kono@gmail.com",
  password: "password",
  password_confirmation: "password",
  about: "Murder mysteries are my favourite"
)
file = URI.open("https://images.unsplash.com/photo-1635107510862-53886e926b74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user2.photo.attach(io: file, filename: "profile_pic.jpg", content_type: "image/jpeg")
user2.save

user3 = User.new(
  first_name: "Becky",
  last_name: "Fisher",
  email: "b.fisher@gmail.com",
  password: "password",
  password_confirmation: "password",
  about: "Love a good romance"
)
file = URI.open("https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user3.photo.attach(io: file, filename: "profile_pic.jpg", content_type: "image/jpeg")
user3.save

puts "finished users"

puts "creating books"

20.times do
  file = URI.open("https://source.unsplash.com/random/?book,cover")

  title = Faker::Book.title
  blurb = Faker::Books::Dune.quote
  author = Faker::Book.author
  genre = Faker::Book.genre
  address = Faker::Address.full_address
  price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
  user = User.all.sample

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
