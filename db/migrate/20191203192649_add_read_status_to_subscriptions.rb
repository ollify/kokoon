class AddReadStatusToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :read, :boolean, default: false
  end
end
