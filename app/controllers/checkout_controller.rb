class CheckoutController < ApplicationController

  def review
    if params[:quantities].blank? or !current_user
      redirect_to root_path
      return
    end

    # Convert the amiibo and quantities to a hash.
    quantities = params[:quantities].permit!.to_h

    @userProvince = Province.find(current_user.provinceId)

    @amiibos_with_quantities = []
    @subtotal = 0

    quantities.each do |amiibo_id, quantity|
      amiibo = Amiibo.find(amiibo_id)
      quantity = quantity.to_i
      @amiibos_with_quantities.push({ amiibo: amiibo, quantity: quantity })
      @subtotal += amiibo.price * quantity
    end

    @totalTaxes = (@subtotal * @userProvince.taxRate).round(2)

    @total =@subtotal + @totalTaxes
  end




  def create
    if params[:quantities].blank?
      redirect_to root_path
      return
    end

    # Convert the amiibo and quantities to a hash.
    quantities = params[:quantities].permit!.to_h

    current_user_tax_rate = Province.find(current_user.provinceId).taxRate

    total_taxes = 0

    line_items = quantities.map do |amiibo_id, quantity|
      amiibo = Amiibo.find(amiibo_id)
      tax_for_item = ((amiibo.price * 100) * current_user_tax_rate)

      total_taxes += tax_for_item * quantity.to_i
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

    line_items << {
    quantity: 1,
    price_data: {
      unit_amount: (total_taxes).to_i,
      currency: 'cad',
      product_data: {
        name: "Total Taxes",
        description: "GST + PST + HST"
      }
    }
  }

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
