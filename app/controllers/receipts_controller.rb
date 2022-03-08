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

    @item_hashes_array = []
    @orders.each do |order|
      order.order_items.each do |item|
        @item_hashes_array << {name: item.food.name, quantity: item.quantity, price: item.food.price}
      end
    end

    @item_hashes_grouped = @item_hashes_array.group_by {|h| h[:name]}.map do |k, v|
      {name: k, quantity: v.inject(0){|s,h| s + h[:quantity] } }
    end
  end
end
