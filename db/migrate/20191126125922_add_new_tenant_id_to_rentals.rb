class AddNewTenantIdToRentals < ActiveRecord::Migration[5.2]
  def change
    add_reference :rentals, :user, foreign_key: true
  end
end
