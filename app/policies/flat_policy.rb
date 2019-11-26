class FlatPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def accept_rental?
    true
    #to be changed
  end

  def accept_rental
    accept_rental?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
