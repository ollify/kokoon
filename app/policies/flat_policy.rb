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

  def join_flat?
    true
    #to be changed
  end

  def accept_rental?
    join_flat?
  end

  def users_in_flat?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
