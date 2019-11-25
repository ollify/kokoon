class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :text
    add_column :users, :birthdate, :date
    add_column :users, :ID_scan, :string
  end
end
