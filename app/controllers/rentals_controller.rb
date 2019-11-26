class RentalsController < ApplicationController
  before_action :set_rental, only: [:edit, :update, :delete]
  before_action :set_flat

  def new
    @rental = Rental.new
    user_names
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
      redirect_to my_account_path
    else
      render 'edit'
    end
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
    params.require(:rental).permit(:price, :start_date, :end_date, :user_id)
  end

  def user_names
    @user_names = User.all.map {|user| user.first_name + " " + user.last_name}
  end

end
