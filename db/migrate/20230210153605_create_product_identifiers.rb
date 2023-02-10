class CreateProductIdentifiers < ActiveRecord::Migration[6.1]
  def change
    create_table :product_identifiers do |t|
      t.string :name
      t.string :value
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
