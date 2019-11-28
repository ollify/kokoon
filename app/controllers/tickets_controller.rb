class TicketsController < ApplicationController
  before_action :set_rental_and_flat
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.rental = @rental
    if @ticket.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  private

  def set_rental_and_flat
    @rental = Rental.find(params[:rental_id])
    @flat = Flat.find(params[:flat_id])
    authorize @flat
  end

  def ticket_params
    params.require(:ticket).permit(:category, :title, :location, :content, :priority, :photo, :status, :subscriptions)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
    # authorize @ticket -> later
  end
end
