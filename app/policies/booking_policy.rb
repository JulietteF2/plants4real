class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def plant_owner?
    record.plant.user == user
  end

  def edit?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    # define logic here
    is_booking_plants_owner?
  end

  def destroy?
    is_owner_or_admin?
  end

  def is_booking_plants_owner?
    @user == @record.plant.user
  end

  private

  def is_owner_or_admin?
    @user == @record.user || @user.admin
  end
end
