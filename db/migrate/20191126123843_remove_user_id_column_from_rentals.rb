class RemoveUserIdColumnFromRentals < ActiveRecord::Migration[5.2]
  def change
    remove_column :rentals, :user_id
  end
end
