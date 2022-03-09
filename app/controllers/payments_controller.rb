class PaymentsController < ApplicationController
  def new
    @receipt = receipt.where(is_paid: false).find(params[:receipt_id])
  end
end
