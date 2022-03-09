class StripeCheckoutSessionService
  def call(event)
    receipt = Receipt.find_by(checkout_session_id: event.data.object.id)
    receipt.update(is_paid: true)
  end
end
