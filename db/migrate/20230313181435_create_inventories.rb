class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :minimum_quantity
      t.integer :maximum_quantity
      t.datetime :starts
      t.datetime :ends

      t.timestamps
    end
  end
end
