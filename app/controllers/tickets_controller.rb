class TicketsController < ApplicationController
  before_action :set_rental_and_flat, except: [:unread, :mark_as_unread]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :mark_as_unread]

  def new
    @ticket = Ticket.new
    @ticket.rental = @rental
    @ticket.potential_subscribers.count.times { @ticket.subscriptions.build }
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.rental = @rental
    authorize @ticket
    if @ticket.save
      Subscription.create(user_id: current_user.id, ticket_id: @ticket.id, read: true)
      Send.deliver
      redirect_to flat_rental_ticket_path(@flat, @rental, @ticket)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @ticket.subscriptions.where(user: current_user).each do |sub|
      sub.read = true
      sub.save
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to flat_rental_ticket_path(@flat, @rental, @ticket)
    else
      render 'edit'
    end
  end

  def destroy
    @ticket.destroy
  end

  def unread
    @tickets = current_user.unread_tickets
    @tickets.each {|ticket| authorize ticket}
  end

  def mark_as_unread
    @ticket.subscriptions.where(user: current_user).each do |sub|
      sub.read = false
      sub.save
    end
    redirect_to flat_path(@ticket.rental.flat)
  end

  private

  def set_rental_and_flat
    @rental = Rental.find(params[:rental_id])
    @flat = @rental.flat
  end

  def ticket_params
    params.require(:ticket).permit(:category, :title, :location, :content, :priority, :photo, :status, subscriptions_attributes: [:id, :user_id, :_destroy])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end
end
