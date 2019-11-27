class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_account
    @flats = Flat.where(user: current_user)
    @rental = Rental.where(tenant_id: current_user.id)
    @my_flat = Flat.find(@rental.first.flat_id) unless @rental.empty?

    @pending_rental = Rental.where(tenant_email: current_user.email)
    @pending_flat = Flat.find(@pending_rental.first.flat_id) unless @pending_rental.empty?

  end
end
