class FlatPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    record.user == user || record.tenants.include?(user)
  end

  def update?
    record.user == user
  end

  def users_in_flat?
    show?
  end

  def new_ticket?
    user.rented_flats.include?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
