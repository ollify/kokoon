class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_account
    #If user has a pending invite for a flat
    @pending_rental = Rental.where(tenant_email: current_user.email, pending: true).last
    @pending_flat = Flat.find(@pending_rental.flat_id) unless @pending_rental.nil?

    #If user is a tenant
    @rental = Rental.where(tenant_id: current_user.id).last
    @my_flat = Flat.find(@rental.flat_id) unless @rental.nil?

    #If user is a landlord
    @flats = Flat.where(user: current_user)
  end

  def privacy_policy


  end
end
