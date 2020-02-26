class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plants = @user.plants
    @bookings = @user.bookings
  end

  def update
    raise
    puts @user.avatar_url
  end
end
