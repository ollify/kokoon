class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  include ApplicationHelper

  def home
  end

  def my_account
    #If user has a pending invite for a flat
    @pending_rental = Rental.where(tenant_email: current_user.email, pending: true).last
    @pending_flat = Flat.find(@pending_rental.flat_id) unless @pending_rental.nil?

    #If user is a tenant
    @rental = last_rental(current_user)
    @my_flat = my_flat(current_user)

    #If user is a landlord
    @flats = Flat.where(user: current_user)
  end

  def privacy_policy
  end

end
