class RentalsController < ApplicationController
  before_action :set_rental, only: [:join_flat, :accept_rental, :edit, :update, :delete]
  before_action :set_flat

  def new
    @rental = Rental.new
    @rental.flat = @flat
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.flat = @flat
    if @rental.save
      redirect_to my_account_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  def join_flat
    authorize @rental
  end

  def accept_rental
    authorize @rental
    @rental.pending = false
    @rental.tenant_id = current_user.id
    @rental.save
    raise unless @rental.save
  end

  def delete
    @rental.destroy
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
    authorize @flat
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:tenant_email, :price, :start_date, :end_date, :tenant_id, :pending)
  end

end