class AddPriceWithMonetizeToRentals < ActiveRecord::Migration[5.2]
  def change
    add_monetize :rentals, :price, currency: { present: false }
  end
end
