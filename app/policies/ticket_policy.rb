class TicketPolicy < FlatPolicy

  def new?
    create?
  end

  def create?
    user.accepted_rentals.include?(record.rental)
  end

  def show?
    true
    # record.subscriptions.include?(user.id)
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
