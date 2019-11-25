class UsersController < ApplicationController
  before_action :set_user

    def show
      @flats = Space.where(user: current_user)
      @rentals = Rental.where(user: current_user)
    end

    def edit
    end

    def update
      if @user.update(user_params)
        redirect_to my_account_path
      else
        render 'edit'
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number, :email, :password, :avatar, :description, :birthdate, :id_scan)
    end

    def set_user
      @user = current_user
    end

  end
