require 'rails_helper'

RSpec.describe "User", :type => :user do
  let(:valid_attributes) do
    {
      first_name: "Elton",
      last_name: "John",
      details: "An avid plant collector",
      email: "elton.john@rocketman.com",
      avatar_url: ""
    }
  end

  # Enforces these attributes when creatign plant: name, location, price, category

  # name
  it "has a first name" do
    user = user.new(first_name: "Elton")
    expect(plant.name).to eq("Elton")
  end

  it "has a last name" do
    user = user.new(last_name: "John")
    expect(user.name).to eq("John")
  end

  # it "name cannot be blank" do
  #   attributes = valid_attributes
  #   attributes.delete(:name)
  #   plant = Plant.new(attributes)
  #   expect(plant).not_to be_valid
  # end

  # # location
  # it "has a location" do
  #   plant = Plant.new(location: "Richmond")
  #   expect(plant.location).to eq("Richmond")
  # end

  # it "location cannot be blank" do
  #   attributes = valid_attributes
  #   attributes.delete(:location)
  #   plant = Plant.new(attributes)
  #   expect(plant).not_to be_valid
  # end

  # # price
  # it "has a price" do
  #   plant = Plant.new(price: 42.69)
  #   expect(plant.price).to eq(42.69)
  # end

  # it "price is a float" do
  #   plant = Plant.new(price: "invalid")
  #   expect(plant).not_to be_valid
  # end

  # it "price cannot be blank" do
  #   attributes = valid_attributes
  #   attributes.delete(:price)
  #   plant = Plant.new(attributes)
  #   expect(plant).not_to be_valid
  # end

  # it "has many bookings" do
  #   plant = Plant.new(valid_attributes)
  #   expect(plant).to respond_to(:bookings)
  #   expect(plant.bookings.count).to eq(0)
  # end
end
