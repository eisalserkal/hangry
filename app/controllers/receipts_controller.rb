class ReceiptsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  def show
    @receipt = Receipt.find(params[:id])
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

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Order ##{@order.id}",
        amount: @sum.to_i * 100,
        currency: 'aed',
        quantity: 1
      }],
      success_url: receipt_url(@receipt),
      cancel_url: receipt_url(@receipt)
    )

    @receipt.update(checkout_session_id: session.id)
  end
end
