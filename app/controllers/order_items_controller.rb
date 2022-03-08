class OrderItemsController < ApplicationController
  def show
    @order_item = OrderItem.find(params[:id])
  end

  def create
    @order_item = OrderItem.new(order_item_params)
    # We need to figure out how to input the order ID and food ID
    if @order_item.save
      redirect_to order_item_path(@order_item)
    else
      render :new
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :status)
  end
end
