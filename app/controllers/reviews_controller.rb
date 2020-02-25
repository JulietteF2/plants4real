class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]

    if @review.save
      redirect_to root_path
    else
      @booking = Booking.find(params[:booking_id])
      @review = Review.new
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    @review = @booking.review
    # raise
  end

  def update
    @booking = Booking.find(params[:booking_id])
    @review = @booking.review
    if @review.update(review_params)
      redirect_to root_path

    else
      @booking = Booking.find(params[:booking_id])
      @review = @booking.review
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
