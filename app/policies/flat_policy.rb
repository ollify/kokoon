class FlatPolicy < ApplicationPolicy
  def show?
    record.user == user || record.accepted_rentals.map{|rental| rental.tenant_id}.include?(user.id)
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
    show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
