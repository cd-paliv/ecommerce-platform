class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :stock
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.belongs_to :size, null: false, foreign_key: true
      t.belongs_to :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
