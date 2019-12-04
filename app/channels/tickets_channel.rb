class TicketsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ticket_#{params[:ticket_id]}"
  end
end
