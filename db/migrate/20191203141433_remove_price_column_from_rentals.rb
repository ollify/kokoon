class RemovePriceColumnFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :price
  end
end
