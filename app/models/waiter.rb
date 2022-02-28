class Waiter < ApplicationRecord
  has_many :covers
  validates :name, presence: true
end
