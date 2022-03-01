class Food < ApplicationRecord
  belongs_to :restaurant
  validates :name, :price, :description, :category, presence: true
  has_many :order_items
  belongs_to :user, through: :restaurant
end
