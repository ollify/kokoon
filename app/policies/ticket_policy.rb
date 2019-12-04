class TicketPolicy < FlatPolicy

  def new?
    create?
  end

  def create?
    user.accepted_rentals.include?(record.rental)
  end

  def show?
    record.subscribers.include?(user)
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def destroy
    edit?
  end

  def unread?
    show?
  end

  def mark_as_unread?
    show?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
