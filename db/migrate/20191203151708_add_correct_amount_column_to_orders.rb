class AddCorrectAmountColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_monetize :orders, :amount,  currency: { present: false }
  end
end
