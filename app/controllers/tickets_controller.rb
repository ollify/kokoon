class TicketsController < ApplicationController
  before_action :set_rental_and_flat
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :create_subscribers, only: [:new, :create, :edit, :update]

  def new
    @ticket = Ticket.new
    @ticket.rental = @rental
    @subscribers.count.times {@ticket.subscriptions.build}
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.rental = @rental
    @ticket.save
    if @ticket.save
      redirect_to flat_rental_ticket_path(@flat, @rental, @ticket)
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

  def destroy
    @ticket.destroy
  end

  private

  def set_rental_and_flat
    @rental = Rental.find(params[:rental_id])
    @flat = Flat.find(params[:flat_id])
    authorize @flat
  end

  def ticket_params
    params.require(:ticket).permit(:category, :title, :location, :content, :priority, :photo, :status, subscriptions_attributes: :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
    # authorize @ticket -> later
  end

  def create_subscribers
    set_rental_and_flat
    @i = 0
    @subscribers = @flat.tenants_and_landlord.map {|subscriber| [subscriber.full_name, subscriber.id]}
  end

end
