class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.string :photo
      t.string :address
      t.integer :capacity
      t.text :description

      t.timestamps
    end
  end
end
