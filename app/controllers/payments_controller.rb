class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @flat = @order.rental.flat

    authorize @order
  end
end
