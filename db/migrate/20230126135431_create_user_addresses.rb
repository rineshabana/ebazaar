class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.belongs_to :user_profile, foreign_key: true
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country_code
      t.string :contact_number

      t.timestamps
    end
  end
end
