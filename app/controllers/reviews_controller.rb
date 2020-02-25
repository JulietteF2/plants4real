class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :show, :create, :edit, :update]
  before_action :create_new_review, only: [:new]

  def new; end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]

    if @review.save
      redirect_to root_path # This should be changed to plant page
    else
      set_booking
      create_new_review
      render :new
    end
  end

  def edit
    get_booking_review
  end

  def update
    get_booking_review
    if @review.update(review_params)
      redirect_to root_path

    else
      set_booking
      get_booking_review
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to root_path # should this go to bookings plant page
  end

  private

  def create_new_review
    @review = Review.new
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def get_booking_review
    @review = @booking.review
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
