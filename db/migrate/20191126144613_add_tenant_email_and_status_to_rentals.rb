class AddTenantEmailAndStatusToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :tenant_email, :string
    add_column :rentals, :status, :string
  end
end
