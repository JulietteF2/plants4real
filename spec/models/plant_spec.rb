require 'rails_helper'

RSpec.describe "Plant", :type => :plant do
  let(:valid_attributes) do
    {
      name: "Fern",
      description: "A green fern",
      location: "Richmond",
      price: 42.69
    }
  end

  # Enforces these attributes when creatign plant: name, location, price, category

  # name
  it "has a name" do
    plant = Plant.new(name: "Fern")
    expect(plant.name).to eq("Fern")
  end

  it "name cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:name)
    plant = Plant.new(attributes)
    expect(plant).not_to be_valid
  end

  # location
  it "has a location" do
    plant = Plant.new(location: "Richmond")
    expect(plant.location).to eq("Richmond")
  end

  it "location cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:location)
    plant = Plant.new(attributes)
    expect(plant).not_to be_valid
  end

  # price
  it "has a price" do
    plant = Plant.new(price: 42.69)
    expect(plant.price).to eq(42.69)
  end

  it "price is a float" do
    plant = Plant.new(price: "invalid")
    expect(plant).not_to be_valid
  end

  it "price cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:price)
    plant = Plant.new(attributes)
    expect(plant).not_to be_valid
  end

  it "has many bookings" do
    plant = Plant.new(valid_attributes)
    expect(plant).to respond_to(:bookings)
    expect(plant.bookings.count).to eq(0)
  end

  # it "should destroy child doses when destroying self" do
  #   cocktail = Cocktail.create!(valid_attributes)
  #   ingredient = Ingredient.create!(name: "ice")
  #   cocktail.doses.create(ingredient: ingredient, description: "A lot!")
  #   expect { cocktail.destroy }.to change { Dose.count }.from(1).to(0)
  # end

  # it "has many ingredients" do
  #   cocktail = Cocktail.create!(valid_attributes)
  #   expect(cocktail).to respond_to(:ingredients)
  #   expect(cocktail.ingredients.count).to eq(0)

  #   ingredient = Ingredient.create!(name: "ice")
  #   cocktail.doses.create(ingredient: ingredient, description: "A lot!")
  #   expect(cocktail.ingredients.count).to eq(1)
  # end
end
