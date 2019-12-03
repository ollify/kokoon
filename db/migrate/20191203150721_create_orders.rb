class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount
      t.integer :days_payment_due
      t.string :checkout_session_id
      t.references :rental, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
