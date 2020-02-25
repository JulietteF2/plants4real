require 'json'
require 'open-uri'

puts 'making shiny happy people'

user_1 = User.create!(email: "daniel.wolf@test.com", password: "password", first_name: "Daniel", last_name: "Wolf-Clark", details: "Likes gingerbread", avatar_url: "https://avatars3.githubusercontent.com/u/9943525?v=4")
user_2 = User.create!(email: "testing7@test.fr", password: "password", first_name: "Juliette", last_name: "Ferrer", details: "Codes too fast", avatar_url: "https://avatars2.githubusercontent.com/u/54906060?v=4")
user_3 = User.create!(email: "nicholas.zeitoun@test.com", password: "password", first_name: "Nicholas", last_name: "Zeitoun", details: "Codes beautifully", avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1578904883/qcs8p18kfktz6p5q7syd.jpg")
user_4 = User.create!(email: "ellen.zhuang@test.com", password: "password", first_name: "Ellen", last_name: "Zhuang", details: "Was sick on Monday", avatar_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1578876938/fn6z8dodasn5rsucxxds.jpg")

puts 'gathering seeds...'

def find_user_id(first_name)
  user = User.where(first_name: first_name).first
  user.id
end

data = File.read('public/plant_seeds.json')
new_plants = JSON.parse(data)
new_plants['plants'].each do |new_plant|
  created_plant = Plant.new(
    name: new_plant['name'],
    description: new_plant['description'],
    location: new_plant['location'],
    price: new_plant['price'],
    category: new_plant['category'],
    user_id: find_user_id(new_plant['user_first_name'])
  )
  created_plant.save!
  if new_plant['bookings']
    new_plant['bookings'].each do |booking|
      created_booking = Booking.new(
        status: booking['status'],
        plant_id: created_plant.id,
        start_date: booking['start_date'],
        end_date: booking['end_date'],
        user_id: find_user_id(booking['first_name'])
      )
      created_booking.total_price = 20 # should update this
      created_booking.save!
      if booking['review']
        review = Review.create!(
          content: booking['review'][0]['content'],
          rating: booking['review'][0]['rating'],
          booking_id: created_booking.id
        )
      end
    end
  end
end

puts 'Plants have grown 🌱☺️🌈'
