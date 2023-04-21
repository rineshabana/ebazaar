class AddTimeZoneToUserProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :time_zone, :string
  end
end
