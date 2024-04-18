class CheckoutController < ApplicationController
  def create
    if params[:quantities].blank?
      redirect_to root_path
      return
    end

    # Convert the amiibo and quantities to a hash.
    quantities = params[:quantities].permit!.to_h

    line_items = quantities.map do |amiibo_id, quantity|
      amiibo = Amiibo.find(amiibo_id)
      {
        quantity: quantity.to_i,
        price_data: {
          unit_amount: (amiibo.price * 100).to_i,
          currency: 'cad',
          product_data: {
            name: amiibo.name,
            description: amiibo.amiibo_series.name
          }
        }
      }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      mode: 'payment',
      line_items: line_items
    )

    redirect_to @session.url, allow_other_host: true
  end

  def success
    # Retrieve session information from Stripe after successful payment
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # Handle cancellation of transaction
  end
end
