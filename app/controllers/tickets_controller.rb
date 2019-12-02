class TicketsController < ApplicationController
  before_action :set_rental_and_flat
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

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
      Subscription.create(user_id: current_user.id, ticket_id: @ticket.id)
      redirect_to flat_rental_ticket_path(@flat, @rental, @ticket)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
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
