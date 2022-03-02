class Food < ApplicationRecord
  belongs_to :restaurant
  validates :name, :price, :description, :category, presence: true
  has_many :order_items
  has_one_attached :photo
end
