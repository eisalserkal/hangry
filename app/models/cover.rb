class Cover < ApplicationRecord
  belongs_to :waiter
  belongs_to :restaurant
  has_many :orders
end
