class RentalsController < ApplicationController
  before_action :set_rental, :set_flat, only: [:edit, :update, :delete]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.flat = @flat
    if @rental.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @rental.flat = @flat
    if @rental.update()
  end

  def delete
    @rental.destroy
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def rental_params
    params.require(:rental).permit(:price, :start_date, :end_date)
  end

end
