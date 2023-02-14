class CreateProductFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :product_features do |t|
      t.string :name
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
