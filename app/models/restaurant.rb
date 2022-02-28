class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_many :covers
end
