require 'rails_helper'

RSpec.describe "Plant", :type => :plant do
  let(:valid_attributes) do
    {
      name: "Fern",
      description: "A green fern",
      image_url: "https://"
    }
  end

  it "has a name" do
    plant = Plant.new(name: "Fern")
    expect(plant.name).to eq("Fern")
  end

  # it "name cannot be blank" do
  #   attributes = valid_attributes
  #   attributes.delete(:name)
  #   cocktail = Cocktail.new(attributes)
  #   expect(cocktail).not_to be_valid
  # end

  # it "name is unique" do
  #   Cocktail.create!(name: "Mojito" ,
  #       description: "Cool drink",
  #       image_url: "https://")
  #   cocktail = Cocktail.new(name: "Mojito",
  #       description: "Cool drink",
  #       image_url: "https://")
  #   expect(cocktail).not_to be_valid
  # end

  # it "has many doses" do
  #   cocktail = Cocktail.new(valid_attributes)
  #   expect(cocktail).to respond_to(:doses)
  #   expect(cocktail.doses.count).to eq(0)
  # end

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
