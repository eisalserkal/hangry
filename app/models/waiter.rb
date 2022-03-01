class Waiter < ApplicationRecord
  has_many :covers
  belongs_to :restaurant
  validates :name, presence: true
end
