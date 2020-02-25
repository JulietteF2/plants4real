require "rails_helper"

begin
  require "bookings_controller"
rescue LoadError
end

if defined?(BookingsController)

  RSpec.describe BookingsController, :type => :routing do
    describe "routing" do

      it "routes to #new" do
        expect(:get => "/plants/1/bookings/new").to route_to(controller: "bookings", action: "new", plant_id: "1")
      end

      it "Booking creation: routes to #show" do
        expect(:post => "/bookings/").to route_to(controller: "bookings", action: "create")
      end

      it "routes to #destroy" do
        expect(:delete => "/bookings/1").to route_to(controller: "bookings", action: "destroy", id: "1")
      end

    end
  end

end
