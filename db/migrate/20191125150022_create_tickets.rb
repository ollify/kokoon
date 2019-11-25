class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :rental, foreign_key: true
      t.string :category
      t.string :title
      t.string :room
      t.text :content
      t.integer :priority
      t.string :photo
      t.string :status

      t.timestamps
    end
  end
end
