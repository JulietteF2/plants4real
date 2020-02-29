require 'rails_helper'

RSpec.describe "User", :type => :user do
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
      category: "Indoor",
      price: 42.69
    }
  end
  # Hash for booking plant attributes to test user
  let(:valid_booking) do
    {
      status: 'Pending',
      start_date: DateTime.parse("25-2-2020"),
      end_date: DateTime.parse("26-2-2020")
    }
  end

  # Enforces these attributes when creating user: first name, last_name

  # name
  it "has a first_name" do
    user = User.new(first_name: "Elton")
    expect(user.first_name).to eq("Elton")
  end

  it "first_name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:first_name)
    user = User.new(attributes)
    expect(user).not_to be_valid
  end

  it "has a last name" do
    user = User.new(last_name: "John")
    expect(user.last_name).to eq("John")
  end

  it "last_name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:last_name)
    user = User.new(attributes)
    expect(user).not_to be_valid
  end

  # Destroys children plants and bookings when User is removed
  it "should destroy child plants when destroying self" do
    user = User.create!(valid_attributes)
    plant = Plant.new(valid_plant)
    plant.user_id = user.id
    plant.save!
    expect { user.destroy }.to change { Plant.count }.from(1).to(0)
  end

  it "should destroy child plant booking when destroying self" do
    user = User.create!(valid_attributes)
    plant = Plant.new(valid_plant)
    plant.user_id = user.id
    plant.save!
    booking = Booking.new(valid_booking)
    booking.user_id = user.id
    booking.plant_id = plant.id
    booking.save!
    expect { user.destroy }.to change { Booking.count }.from(1).to(0)
  end
end
