class ReceiptsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  def show
    @receipt = Receipt.find(params[:id])
    @receipt.is_paid = true
    @receipt.save
    @orders = @receipt.orders
    @order = @orders.first
    @cover = @order.cover
    @sum = 0
    @orders.each do |order|
      order.order_items.each do |item|
        @sum += item.food.price * item.quantity
      end
    end
  end
end
