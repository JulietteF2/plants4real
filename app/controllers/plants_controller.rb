class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
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
    @plant = Plant.find(params[:id])
  end

  def update
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy

    redirect_to user_path(current_user)
  end

  private

  def booking_dates
    raise
    redirect_to new_plant_booking_path
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :location, :price, :category)
  end
end
