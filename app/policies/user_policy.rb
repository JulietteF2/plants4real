class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def current_user?
    record == user
  end

  def show?
    true
  end
end
