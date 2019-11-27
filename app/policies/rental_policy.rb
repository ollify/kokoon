class RentalPolicy < ApplicationPolicy
  def new?
    record.flat.user == user
  end

  def create?
    new?
  end

  def edit?
    record.flat.user == user
  end

  def update?
    edit?
  end

  def join_flat?
    record.tenant_email == user.email
  end

  def accept_rental?
    join_flat?
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
