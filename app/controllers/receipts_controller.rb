class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    @receipt.is_paid = true
    @orders = @receipt.orders
    @sum = 0
    @orders.each do |order|
      order.order_items.each do |item|
        @sum += item.food.price
      end
    end
  end
end
