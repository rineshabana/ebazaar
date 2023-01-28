class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, foreign_key: true, index: { unique: true }
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :dob
      t.integer :gender
      t.string :country_code
      t.string :contact_number

      t.timestamps
    end
  end
end
