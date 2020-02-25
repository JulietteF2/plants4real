
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


bob = User.create!(email: "testing7@test.fr", password: "password", first_name: "Testing2", last_name: "Testing2", details: nil, avatar_url: nil)
bob2 = User.create!(email: "testing3@test.fr", password: "password", first_name: "Testing3", last_name: "Testing3", details: nil, avatar_url: nil)
bob3 = User.create!(email: "testing4@test.fr", password: "password", first_name: "Testing4", last_name: "Testing4", details: nil, avatar_url: nil)
bob4 = User.create!(email: "testing5@test.fr", password: "password", first_name: "Testing5", last_name: "Testing5", details: nil, avatar_url: nil)
bob5 = User.create!(email: "testing6@test.fr", password: "password", first_name: "Testing6", last_name: "Testing6", details: nil, avatar_url: nil)

plant1 = Plant.create!(name: "Testplant3", location: "Testloc3", price: 5.6, category: "indoor", user: bob)
plant2 = Plant.create!(name: "Testplant4", location: "Testloc4", price: 5.6, category: "indoor", user: bob2)
plant3 = Plant.create!(name: "Testplant5", location: "Testloc5", price: 5.6, category: "indoor", user: bob3)
plant4 = Plant.create!(name: "Testplant6", location: "Testloc6", price: 5.6, category: "indoor", user: bob4)
plant5 = Plant.create!(name: "Testplant7", location: "Testloc7", price: 5.6, category: "indoor", user: bob5)
plant6 = Plant.create!(name: "Testplant8", location: "Testloc8", price: 5.6, category: "indoor", user: bob)

book1 = Booking.create!(start_date: "02.03.2020", end_date: "03.04.2020", user: bob, plant: plant2)
book2 = Booking.create!(start_date: "15.03.2020", end_date: "03.04.2020", user: bob2, plant: plant3)
book3 = Booking.create!(start_date: "02.03.2020", end_date: "20.04.2020", user: bob3, plant: plant4)
book4 = Booking.create!(start_date: "07.05.2020", end_date: "22.11.2020", user: bob4, plant: plant5)
book5 = Booking.create!(start_date: "02.03.2020", end_date: "03.04.2020", user: bob5, plant: plant6)
book6 = Booking.create!(start_date: "15.03.2020", end_date: "03.04.2020", user: bob, plant: plant2)
book7 = Booking.create!(start_date: "02.03.2020", end_date: "20.04.2020", user: bob2, plant: plant1)
book8 = Booking.create!(start_date: "07.05.2020", end_date: "22.11.2020", user: bob3, plant: plant3)


Review.create!(rating: 1, booking: book1)
Review.create!(rating: 2, booking: book2)
Review.create!(rating: 3, booking: book3)
Review.create!(rating: 4, booking: book4)
Review.create!(rating: 5, booking: book5)
Review.create!(rating: 3, booking: book6)

