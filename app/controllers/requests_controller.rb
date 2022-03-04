class RequestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :create ]
  def index
    @requests = Request.all
  end

  def create
    @order = Order.find(params[:order_id])
    @request = Request.new(request_params)
    @request.order = @order
    @request.save
    redirect_to order_path(@order)
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
