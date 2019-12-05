class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  include ApplicationHelper

  def home
    if user_signed_in?
      redirect_to my_account_path
    end
  end

  def my_account
    #If user has a pending invite for a flat
    @pending_invites = current_user.pending_invites

    #If user is a tenant
    @rented_flats = current_user.rented_flats

    #If user is a landlord
    @owned_flats = Flat.where(user: current_user)
    @sorted_tickets = current_user.unread_tickets.sort_by{|k, v| k[:priority]}.reverse
  end

  def privacy_policy
  end

end
