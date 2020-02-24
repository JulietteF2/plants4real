require 'rails_helper'

RSpec.describe "Review", :type => :review do
  # Hash for valid user attributes to test build user
  let(:valid_attributes) do
    {
      first_name: "Elton",
      last_name: "John",
      details: "An avid plant collector",
      email: "elton.john@rocketman.com",
      password: "password",
      avatar_url: ""
    }
  end

  # Hash for valid plant attributes to test user
  let(:valid_plant) do
    {
      name: "Fern",
      description: "A green fern",
      location: "Richmond",
      category: "green",
      price: 42.69
    }
  end

  # Hash for booking plant attributes to test user
  let(:valid_booking) do
    {
      start_date: DateTime.parse("25-2-2020"),
      end_date: DateTime.parse("26-2-2020")
    }
  end

  # has a rating

  # must have a rating

  # rating must be 1234 or 5

  # Belongs to a booking
  it "belongs to a plant" do
    user = User.create!(valid_attributes)
    plant = Plant.new(valid_plant)
    plant.user_id = user.id
    plant.save!
    booking = Booking.new(valid_booking)
    booking.user_id = user.id
    booking.plant_id = plant.id
    booking.save!
    review = Review.new(rating: 5)
    review.booking_id = booking.id
    review.save!
    expect(review.booking).to eq(booking)
  end

  # Has a plant through booking
  it "has a plant through booking" do
    review = Review.new(rating: 5)
    expect(review).to respond_to(:booking)
  end
end
