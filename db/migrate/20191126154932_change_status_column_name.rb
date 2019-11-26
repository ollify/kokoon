class ChangeStatusColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :rentals, :status, :pending
  end
end
