class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @booking.plant_id = params[:plant_id]
    @booking.start_date = params[:booking]["start_date"]
    @booking.end_date = params[:booking]["end_date"]
    if @booking.start_date.nil?
      puts "no booking deets"
      redirect_to plant_path(@booking.plant_id)
    else
      @booking.total_price = set_total_price
    end
    @booking.status = 'Pending'
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      puts "not valid"
      render :new
    end
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :total_price, :plant_id)
  end

  def set_total_price
    @plant = Plant.find(params[:plant_id])
    # booking end_date - start_date returns seconds
    ((@booking.end_date - @booking.start_date) / 86400) * @plant.price
  end
end

