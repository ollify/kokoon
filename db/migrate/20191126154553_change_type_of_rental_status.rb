class ChangeTypeOfRentalStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :rentals, :status, 'boolean USING CAST(status AS boolean)'
  end
end
