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

User.destroy_all
Book.destroy_all

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
# book 1
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/51gDkZW2+9S._SX331_BO1,204,203,200_.jpg")

book1 = Book.new(
  title: "Alice's Adventures in Wonderland",
  blurb:"A young girl named Alice falls through a rabbit hole into a fantasy world of anthropomorphic creatures. It is seen as an example of the literary nonsense genre. One of the best-known works of Victorian literature, its narrative, structure, characters and imagery have had huge influence on popular culture and literature, especially in the fantasy genre.",
  author: "Lewis Carroll",
  genre: "Fantasy",
  price_per_day: price
)
book1.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book1.user = user
book1.save

# book 2
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/61zZqo5p7zL.jpg")

book2 = Book.new(
  title: "Where the crawdads sing",
  blurb:"For years, rumors of the 'Marsh Girl' have haunted Barkley Cove, a quiet town on the North Carolina coast. She's barefoot and wild; unfit for polite society. So in late 1969, when handsome Chase Andrews is found dead, the locals immediately suspect Kya Clark. But Kya is not what they say. Abandoned at age ten, she has survived on her own in the marsh that she calls home. A born naturalist with just one day of school, she takes life lessons from the land, learning from the false signals of fireflies the real way of this world. But while she could have lived in solitude forever, the time comes when she yearns to be touched and loved. Drawn to two young men from town, who are each intrigued by her wild beauty, Kya opens herself to a new and startling world--until the unthinkable happens. In Where the Crawdads Sing, Owens juxtaposes an exquisite ode to the natural world against a heartbreaking coming of age story and a surprising murder investigation.",
  author: "Delia Owens",
  genre: "Mystery/Coming of Age",
  price_per_day: price
)
book2.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book2.user = user
book2.save

# book 3
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images.penguinrandomhouse.com/cover/9780307277671")

book3 = Book.new(
  title: "The Da Vinci Code",
  blurb:"The Da Vinci Code follows 'symbologist' Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris causes them to become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ and Mary Magdalene having had a child together.",
  author: "Dan Brown",
  genre: "hriller",
  price_per_day: price
)
book3.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book3.user = user
book3.save

# book 4
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/71OwIzPjs7L.jpg")

book4 = Book.new(
  title: "Twilight",
  blurb:"Bella Swan and Edward Cullen, a pair of star-crossed lovers whose forbidden relationship ripens against the backdrop of small-town suspicion and a mysterious coven of vampires.",
  author: "Stephenie Meyer",
  genre: "Fantasy/Romance",
  price_per_day: price
)
book4.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book4.user = user
book4.save

# book 5
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1596556751l/54816211._SY475_.jpg")

book5 = Book.new(
  title: "Writing papers in psychology",
  blurb:"Psychology writing, like writing in the other sciences, is meant to inform the reader about a new idea, theory or experiment. Toward this end, academic psychologists emphasize the importance of clarity and brevity in writing while minimizing descriptive language and complex sentence structure. The best writers of psychology have the ability to make complex ideas understandable to people outside of their area of expertise. ",
  author: "Ralph L. Rosnow",
  genre: "Textbook",
  price_per_day: price
)
book5.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book5.user = user
book5.save

# book 6
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/81PdOsc95OL.jpg")

book6 = Book.new(
  title: "It Ends With Us",
  blurb:"Lily hasn't always had it easy, but that's never stopped her from working hard for the life she wants. She's come a long way from the small town in Maine where she grew up--she graduated from college, moved to Boston, and started her own business. So when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily's life suddenly seems almost too good to be true. Ryle is assertive, stubborn, maybe even a little arrogant. He's also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn't hurt. Lily can't get him out of her head. But Ryle's complete aversion to relationships is disturbing.",
  author: "Colleen Hoover",
  genre: "Romance",
  price_per_day: price
)
book6.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book6.user = user
book6.save

# book 7
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/81DwmIj0n3L.jpg")

book7 = Book.new(
  title: "The 48 laws of power",
  blurb:"Amoral, cunning, ruthless, and instructive, this piercing work distills three thousand years of the history of power in to forty-eight well explicated laws. As attention--grabbing in its design as it is in its content, this bold volume outlines the laws of power in their unvarnished essence, synthesizing the philosophies of Machiavelli, Sun-tzu, Carl von Clausewitz, and other great thinkers. Some laws teach the need for prudence ('Law 1: Never Outshine the Master'), the virtue of stealth ('Law 3: Conceal Your Intentions'), and many demand the total absence of mercy ('Law 15: Crush Your Enemy Totally'), but like it or not, all have applications in real life. Illustrated through the tactics of Queen Elizabeth I, Henry Kissinger, P. T. Barnum, and other famous figures who have wielded--or been victimized by--power, these laws will fascinate any reader interested in gaining, observing, or defending against ultimate control.",
  author: "Robert Greene",
  genre: "Non-Fiction",
  price_per_day: price
)
book7.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book7.user = user
book7.save

# book 8
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://upload.wikimedia.org/wikipedia/en/9/93/AGameOfThrones.jpg")

book8 = Book.new(
  title: "A Game of Thrones",
  blurb:"A Game of Thrones is the first novel in A Song of Ice and Fire, a series of fantasy novels by the American author George R. R. Martin. It was first published on August 1, 1996. The novel won the 1997 Locus Award and was nominated for both the 1997 Nebula Award and the 1997 World Fantasy Award. The novella Blood of the Dragon, comprising the Daenerys Targaryen chapters from the novel, won the 1997 Hugo Award for Best Novella. In January 2011, the novel became a New York Times Bestseller and reached No. 1 on the list in July 2011.",
  author: "George R.R Martin",
  genre: "Fantasy",
  price_per_day: price
)
book8.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book8.user = user
book8.save

# book 9
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1461082527l/29502206.jpg")

book9 = Book.new(
  title: "Pantomime",
  blurb:"Gene, the daughter of a noble family, runs away from the decadence of court to R.H. Ragona's circus of magic, where she meets runaway Micah, whose blood could unlock the mysteries of the world of Ellada.",
  author: "Laura Lam",
  genre: "Fantasy",
  price_per_day: price
)
book9.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book9.user = user
book9.save

# book 10
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/A14qMetuZsL.jpg")

book10 = Book.new(
  title: "Lawn boy",
  blurb:"Mike Muñoz is a young Mexican American not too many years out of high school--and just fired from his latest gig as a lawn boy on a landscaping crew. Though he tries time and again to get his foot on the first rung of that ladder to success, he can't seem to get a break. But then things start to change for Mike, and after a raucous, jarring, and challenging trip, he finds he can finally see the future and his place in it",
  author: "Jonathan Evison",
  genre: "Fiction",
  price_per_day: price
)
book10.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book10.user = user
book10.save

# book 11
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://m.media-amazon.com/images/I/511pn-fNGlL.jpg")

book11 = Book.new(
  title: "Crazy Horse and Custer",
  blurb:"On the sparkling morning of June 25, 1876, 611 U.S. Army soldiers rode toward the banks of the Little Bighorn in the Montana Territory, where 3,000 Indians stood waiting to battle.The lives of two great warriors would soon be forever linked throughout history: Crazy Horse, leader of the Oglala Sioux, and General George Armstrong Custer of the Seventh Cavalry. Both were men of aggression and supreme courage. Both had become leaders in their societies at very early ages; both had been stripped of power, and in disgrace had worked to earn back the respect of their people. And to both of them, the unspoiled grandeur of the Great Plains of North America was an irresistible challenge. Their parallel lives would pave the way, in a manner unknown to either, for an inevitable clash between the two nations fighting for possession of the open prairie.",
  author: "Stephen E. Ambrose",
  genre: "Biography",
  price_per_day: price
)
book11.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book11.user = user
book11.save

# book 12
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://m.media-amazon.com/images/I/51x53xtKI0L.jpg")

book12 = Book.new(
  title: "The Hitch Hiker's Guide to the Galaxy",
  blurb:"The Hitchhiker's Guide to the Galaxy is the first of six books in the Hitchhiker's Guide to the Galaxy comedy science fiction 'hexalogy' by Douglas Adams. The novel is an adaptation of the first four parts of Adams's radio series of the same name. The novel was first published in London on 12 October 1979. It sold 250,000 copies in the first three months.",
  author: "Douglas Adams",
  genre: "Science Fiction",
  price_per_day: price
)
book12.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book12.user = user
book12.save

# book 13
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://cdn.waterstones.com/bookjackets/large/9781/4351/9781435129733.jpg")

book13 = Book.new(
  title: "Dracula",
  blurb:"It tells the story of Dracula's attempt to move from Transylvania to England so he may find new blood and spread undead curse, and the battle between Dracula and a small group of men and women led by Professor Abraham Van Helsing.",
  author: "Bram Stoker",
  genre: "Horror",
  price_per_day: price
)
book13.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book13.user = user
book13.save

# book 14
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://upload.wikimedia.org/wikipedia/en/3/31/Carrienovel.jpg")

book14 = Book.new(
  title: "Carrie",
  blurb:"arrie may be picked on by her classmates but she has a gift. She can move things with her mind. Doors lock. Candles fall. This is her power and her problem. To be invited to Prom Night by Tommy Ross is a dream come true for Carrie — the first step towards social acceptance by her high school colleagues. Until an unexpected cruelty turns her gift into a weapon of terror and destruction that no one will ever forget.",
  author: "Steven King",
  genre: "Horror",
  price_per_day: price
)
book14.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book14.user = user
book14.save

# book 15
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/1984first.jpg/330px-1984first.jpg")

book15 = Book.new(
  title: "Nineteen Eighty-Four",
  blurb:"Set in Oceania, the ultimate totalitarian state, it describes a society tyrannized by a ruling party led by Big Brother. In the furtherance of eradicating all expressions of individuality, people's lives are constantly monitored. Telescreens are everywhere, helicopters hover around buildings, spying through windows, and the Thought Police are constantly on alert.",
  author: "George Orwell",
  genre: "Dystopian",
  price_per_day: price
)
book15.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book15.user = user
book15.save

# book 16
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://upload.wikimedia.org/wikipedia/en/9/98/The_City_of_Ember.jpg")

book16 = Book.new(
  title: "The City of Ember",
  blurb:"The city of Ember was built as a last refuge for the human race. Two hundred years later, the great lamps that light the city are beginning to flicker. When Lina finds part of an ancient message, she's sure it holds a secret that will save the city. She and her friend Doon must decipher the message before the lights go out on Ember forever! This stunning debut novel offers refreshingly clear writing and fascinating, original characters",
  author: "Jeanne DuPrau",
  genre: "Children's/Science Fiction",
  price_per_day: price
)
book16.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book16.user = user
book16.save

# book 17
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/51QC8X+TDyL._SX340_BO1,204,203,200_.jpg")

book17 = Book.new(
  title: "Phantom Tollbooth",
  blurb:"It tells the story of a bored young boy named Milo who unexpectedly receives a magic tollbooth one afternoon and, having nothing better to do, drives through it in his toy car, transporting him to the Kingdom of Wisdom, once prosperous but now troubled. There, he acquires two faithful companions, a dog named Tock and the Humbug, and goes on a quest to restore to the kingdom its exiled princesses—named Rhyme and Reason—from the Castle in the Air. ",
  author: "Norton Juster",
  genre: "Children's",
  price_per_day: price
)
book17.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book17.user = user
book17.save

# book 18
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://lirp.cdn-website.com/cb857eec/dms3rep/multi/opt/The+Same+Breath+Cover+1-598w.jpg")

book18 = Book.new(
  title: "The Same Breath",
  blurb:"Teancum Leon, who goes by Tean, is a wildlife veterinarian. His life has settled into a holding pattern: he loves his job, he hates first dates, and he only occasionally has to deal with his neighbor Mrs. Wish's cat-related disasters.All of that changes, though, when a man appears in his office, asking for help to find his brother. Jem is convinced that something bad has happened to Benny, and he thinks Tean might be able to help. Tean isn't sure, but he's willing to try. ",
  author: "Gregory Ashe",
  genre: "Mystery/Romance",
  price_per_day: price
)
book18.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book18.user = user
book18.save

# book 19
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://images-na.ssl-images-amazon.com/images/I/91tFtUf+0ZL.jpg")

book19 = Book.new(
  title: "House of Earth and Blood",
  blurb:"Bryce Quinlan had the perfect life-working hard all day and partying all night-until a demon murdered her closest friends, leaving her bereft, wounded, and alone. When the accused is behind bars but the crimes start up again, Bryce finds herself at the heart of the investigation. She'll do whatever it takes to avenge their deaths.",
  author: "Sarah J.Maas",
  genre: "Fantasy",
  price_per_day: price
)
book19.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book19.user = user
book19.save

# book 20
user = User.all.sample
price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/a/a8/Of_Mice_and_Men_%281937_1st_ed_dust_jacket%29.jpg")

book20 = Book.new(
  title: "Of Mice and Men",
  blurb:"They are an unlikely pair: George is small and quick and dark of face; Lennie, a man of tremendous size, has the mind of a young child. Yet they have formed a family, clinging together in the face of loneliness and alienation.",
  author: "John Steinbeck",
  genre: "Classic",
  price_per_day: price
)
book20.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

book20.user = user
book20.save

puts "finished"
# 20.times do
#

#   title = Faker::Book.title
#   blurb = "#{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph}#{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph}"
#   author = Faker::Book.author
#   genre = Faker::Book.genre
#   address = Faker::Address.full_address
#   price = Faker::Number.between(from: 0.0, to: 1.0).round(2)
#   user = User.all.sample

#   book = Book.new(
#     title:,
#     blurb:,
#     author:,
#     genre:,
#     address:,
#     price_per_day: price
#   )

#   book.photo.attach(io: file, filename: "book-cover.jpg", content_type: "image/jpeg")

#   book.user = user
#   book.save
# end
