require 'rails_helper'

RSpec.describe "Booking", :type => :booking do
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

  let (:test_user) do
    User.create!(valid_attributes)
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

  let (:test_plant) do
    user = User.create!(valid_attributes)
    plant = Plant.new(valid_plant)
    plant.user_id = user.id
    plant.save!
    puts plant
  end
  # Hash for booking plant attributes to test user
  let(:valid_booking) do
    {
      start_date: DateTime.parse("25-2-2020"),
      end_date: DateTime.parse("26-2-2020")
    }
  end

  # Enforces these attributes when creating user: start_date, end_date

  # Start
  it "has a start_date" do
    booking = Booking.new(start_date: DateTime.parse("25-2-2020"))
    expect(booking.start_date).to eq(DateTime.parse("25-2-2020"))
  end

  it "start_date cannot be blank" do
    attributes = valid_booking
    attributes.delete(:start_date)
    booking = Booking.new(attributes)
    expect(booking).not_to be_valid
  end

  # End
  it "has an end_date" do
    booking = Booking.new(end_date: DateTime.parse("26-2-2020"))
    expect(booking.end_date).to eq(DateTime.parse("26-2-2020"))
  end

  it "end_date cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:last_name)
    user = User.new(attributes)
    expect(user).not_to be_valid
  end

  # Belongs to a plant
  it "belongs to a plant" do
    user = User.create!(valid_attributes)
    plant = Plant.new(valid_plant)
    plant.user_id = user.id
    plant.save!
    booking = Booking.new(valid_booking)
    booking.user_id = user.id
    booking.plant_id = plant.id
    booking.save!
    expect(booking.plant).to eq(plant)
  end

  # Belongs to a user
  it "belongs to a user" do
    user = User.create!(valid_attributes)
    booking = Booking.new(valid_booking)
    booking.user_id = user.id
    expect(booking.user).to eq(user)
  end

  # Has many review children
  it "has a review" do
    booking = Booking.new(valid_booking)
    expect(booking).to respond_to(:review)
  end

  # Destroys children reviews when Booking is removed
  it "should destroy child reviews when destroying self" do
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
    expect { booking.destroy }.to change { Review.count }.from(1).to(0)
  end
end
