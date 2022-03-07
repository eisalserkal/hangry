class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :create ]
  def index
    @requests = Request.all
  end

  def create
    @order = Order.find(params[:order_id])
    @restaurant = @order.cover.restaurant
    @request = Request.new(request_params)
    @request.order = @order
    if @request.save
      RestaurantChannel.broadcast_to(
        @restaurant,
        render_to_string(partial: "request", locals: {request: @request})
      )
      redirect_to order_path(@order)
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to dashboard_path
  end

  def request_params
    params.require(:request).permit(:content)
  end
end
