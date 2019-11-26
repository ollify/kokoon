class AddLandlordAndTenantToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :landlord_id, :integer
    add_reference :rentals, :user, foreign_key: true
  end
end
