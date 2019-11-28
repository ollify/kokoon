class TicketPolicy < FlatPolicy

  def new?
    create?
  end

  def create?
    record.rental.flat_id == user.my_flat.id
  end

  def show?
    true
    # record.subscriptions.include?(user.id)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
