class Order < ApplicationRecord
  belongs_to :receipt
  belongs_to :cover
  has_many :requests
  has_many :order_items

  def total
    sum = 0
    @order.order_items.each do |order|
      sum += order.price
    end
    return sum
  end
end
