class RentalsController < ApplicationController
  before_action :set_flat
  before_action :set_rental, only: [:join_flat, :accept_rental, :edit, :show, :update, :destroy, :rental_payment]


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
      UserMailer.with(rental: @rental).invitation.deliver_now
      redirect_to flat_path(@flat)
    else
      render 'new'
    end
  end

  def show
    authorize @flat
    authorize @rental
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Rental contract No. #{@rental.id}",
        page_size: 'A4',
        template: "rentals/show.html.erb",
        layout: "pdf.html",
        orientation: "Portrait",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  def index
    @user = current_user
    @rentals = policy_scope(Rental).order(created_at: :desc)
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

  def rental_payment
  end

  def accept_rental
    @rental.pending = false
    @rental.tenant_id = current_user.id
    if @rental.save
      redirect_to flat_path(@flat)
      UserMailer.welcome.deliver_now
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
