class FlatPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def join_flat?
    true
  end

  def accept_rental?
    join_flat?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
