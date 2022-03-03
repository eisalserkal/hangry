class ReceiptsController < ApplicationController
  def show
    @receipt = Receipt.find(params[:id])
    @receipt.is_paid = true
    @receipt.save
    @orders = @receipt.orders
    @cover = @orders[0].cover
    @sum = 0
    @orders.each do |order|
      order.order_items.each do |item|
        @sum += item.food.price * item.quantity
      end
    end
  end
end
