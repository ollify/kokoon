class RentalPolicy < FlatPolicy
  def new?
    record.flat.user == user
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    edit?
  end

  def show?
    new? || join_flat?
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

  def rental_payment?
    show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
