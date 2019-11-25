class ChangeIdField < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :ID_scan, :id_scan
  end
end
