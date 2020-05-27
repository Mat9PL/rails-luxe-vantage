class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user == user || user.admin
  end

  def edit?
    update?
  end

  def destroy?
    record.user == user || user.admin
  end
end
