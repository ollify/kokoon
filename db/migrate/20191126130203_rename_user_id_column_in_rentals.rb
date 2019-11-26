class RenameUserIdColumnInRentals < ActiveRecord::Migration[5.2]
  def change
    rename_column :rentals, :user_id, :tenant_id
  end
end
