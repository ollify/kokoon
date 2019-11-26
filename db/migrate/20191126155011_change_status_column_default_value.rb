class ChangeStatusColumnDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :rentals, :pending, from: nil, to: true
  end
end
