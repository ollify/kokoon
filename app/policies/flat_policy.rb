class FlatPolicy < ApplicationPolicy
  def show?
    record.user == user || record.accepted_rentals.include?(user.id)
  end

  def update?
    record.user == user
  end

  # def join_flat?
  #   true
  # end

  # def accept_rental?
  #   join_flat?
  # end

  def users_in_flat?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
