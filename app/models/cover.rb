class Cover < ApplicationRecord
  belongs_to :waiter
  belongs_to :restaurant
end
