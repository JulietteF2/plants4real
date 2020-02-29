class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @plants = @user.plants
    @bookings = @user.bookings
  end

  def update
    raise
    puts @user.avatar_url
  end
end
