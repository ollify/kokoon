class RemoveAmountCurrencyFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :amount_cents
    remove_column :orders, :amount_currency
  end
end
