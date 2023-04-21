class Product < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :product_features, dependent: :destroy
  has_many :product_identifiers, dependent: :destroy
  has_and_belongs_to_many :categories
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  accepts_nested_attributes_for :product_features
  accepts_nested_attributes_for :product_identifiers
  has_one_attached :image, dependent: :destroy
  has_many_attached :support_images, dependent: :destroy
  has_rich_text :content
end
