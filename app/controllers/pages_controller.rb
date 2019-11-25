class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_account
    @user = current_user
    @flats = Flat.where(user: current_user)
  end
end
