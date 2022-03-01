class Waiter < ApplicationRecord
  has_many :covers
  belongs_to :restaurant
  validates :name, presence: true
  belongs_to :user, through: :restaurant
end
