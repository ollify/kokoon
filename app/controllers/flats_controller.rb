class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update]

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @user = current_user
    @flats = policy_scope(Flat).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render 'edit'
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def flat_params
    params.require(:flat).permit(:photo, :address, :capacity, :description)
  end

end
