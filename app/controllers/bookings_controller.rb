class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @booking.user = current_user
    @booking.plant_id = params[:plant_id]
    @booking.start_date = params[:booking_dates]["start_date"]
    @booking.end_date = params[:booking_dates]["end_date"]
    @booking.total_price = set_total_price
    @booking.status = 'Pending'
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      puts "not valid"
      render :new
    end
  end

  def edit
    # /!\ we should only be able to edit status
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # /!\ we should only be able to edit status
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :user_id, :total_price, :plant_id)
  end

  def set_total_price
    @plant = Plant.find(params[:plant_id])
    # Need to retrieve start date and end date from params (query maybe?)
    # booking end_date - start_date returns SECONDS
    ((@booking.end_date - @booking.start_date) / 86400) * @plant.price
  end
end

