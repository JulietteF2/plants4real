class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.plant_id = params[:plant_id]
    @booking.total_price = set_total_price
    @booking.status = 'Pending'

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    # /!\ we should only be able to edit status
    @booking = Booking.find(params[:id])
  end

  def update
    # /!\ we should only be able to edit status
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_total_price
    @plant = Plant.find(params[:plant_id])
    # Need to retrieve start date and end date from params (query maybe?)
    (@booking.end_date - @booking.start_date) * @plant.price
  end
end

