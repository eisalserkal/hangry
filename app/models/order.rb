class Order < ApplicationRecord
  belongs_to :receipt
  belongs_to :cover
  has_many :requests
  has_many :order_items
end
