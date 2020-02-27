class PlantsController < ApplicationController
  before_action :geocode, only: [:index, :show]
  before_action :set_plant, only: [:destroy, :show, :edit, :update]

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # refactor with a hash builder method (plant)
    @markers = @plants.map do |plant|
      plant_hash(plant)
    end

    if params[:query].present?
      @plants = Plant.search_full_text(params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @bookings = @plant.bookings

    # refactor with a hash builder method (plant)
    @markers =[plant_hash(@plant)]
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user

    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy

    redirect_to user_path(current_user)
  end

  private

  def plant_hash(plant)
    { lat: plant.latitude,
      lng: plant.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { plant: plant }),
      image_url: helpers.asset_url('plant.png')
    }
  end

  def geocode
    @plants = Plant.geocoded
  end

  def booking_dates
    redirect_to new_plant_booking_path
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :location, :price, :category, :photo)
  end
end
