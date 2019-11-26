class RemoveTenantIdColumnFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :tenant_id
  end
end
