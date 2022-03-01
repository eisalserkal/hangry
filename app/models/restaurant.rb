class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :covers
  has_many :waiters
  validates :user_id, uniqueness: true
end
