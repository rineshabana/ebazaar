class UserAddress < ApplicationRecord
  validates :city, presence: true
  belongs_to :user_profile
end
