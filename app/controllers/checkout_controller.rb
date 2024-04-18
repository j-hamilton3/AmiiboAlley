class CheckoutController < ApplicationController
  def create
    # Establish a connection with Stripe and redirect the user to the payment screen

    # Return if shopping cart is empty.
    if params[:shopping_cart].nil?
      redirect_to root_path
      return
    end

    shopping_cart = params[:shopping_cart].split
    line_items = [] # Initialize an empty array for line items

    # Iterate through each amiibo in the shopping cart
    shopping_cart.each do |amiibo_id|
      # Find the amiibo
      amiibo = Amiibo.find(amiibo_id)

      # Add the amiibo to the line items array
      line_items << {
        quantity: 1, # We will hardcode one for this demo.
        price_data: {
          unit_amount: (amiibo.price * 100).to_i,
          currency: "cad",
          product_data: {
            name: amiibo.name,
            description: amiibo.amiibo_series.name
          }
        }
      }
    end

    # Create a Stripe Checkout Session with the line items
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: line_items # Set the line items for the session
    )

    # Redirect to the session URL
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
