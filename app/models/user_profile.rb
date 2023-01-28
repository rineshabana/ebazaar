class UserProfile < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  has_many :user_addresses, dependent: :destroy
end
