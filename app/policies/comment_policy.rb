class CommentPolicy < TicketPolicy
  def create?
    record.ticket.subscriptions.map {|sub| sub.user_id}.include?(user.id)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
