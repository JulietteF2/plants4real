class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def is_plant_owner?
    is_owner_or_admin?
  end

  def edit?
    is_owner_or_admin?
  end

  def update?
    # define logic here
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    @user.nil? ? false : (@user == @record.user || @user.admin)
  end
end
