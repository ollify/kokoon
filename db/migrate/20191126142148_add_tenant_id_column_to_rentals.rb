class AddTenantIdColumnToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :tenant_id, :integer
  end
end
