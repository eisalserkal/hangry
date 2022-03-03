class OrdersController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @orders = Order.all
  end

  def create
    @cover = Cover.find(params[:cover_id])
    @order = Order.new
    @order.cover = @cover
    @receipt = Receipt.new
    @receipt.save
    @order.receipt = @receipt
    if @order.save
      params[:orders].each do |order|
        food_item = OrderItem.new(quantity: order[:quantity], food_id: order[:id])
        food_item.order = @order
        food_item.save
      end

      render json: @order
    end
  end

  def show
    @order = Order.find(params[:id])
    @cover = @order.cover
    @waiter = @cover.waiter
    @request = Request.new
    @receipt = @order.receipt
  end
end
