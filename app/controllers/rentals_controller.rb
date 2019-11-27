class RentalsController < ApplicationController
  before_action :set_rental, only: [:join_flat, :accept_rental, :edit, :update, :destroy]
  before_action :set_flat

  def new
    @rental = Rental.new
    @rental.flat = @flat
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.flat = @flat
    authorize @flat
    if @rental.save
      redirect_to flat_path(@flat)
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
  end

  def accept_rental
    @rental.pending = false
    @rental.tenant_id = current_user.id
    if @rental.save
      redirect_to flat_path(@flat)
    else
      render 'rental/join_flat'
    end
  end

  def destroy
    @rental.destroy
    redirect_to flat_path(@flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_rental
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def rental_params
    params.require(:rental).permit(:tenant_email, :price, :start_date, :end_date, :tenant_id, :pending)
  end

end
