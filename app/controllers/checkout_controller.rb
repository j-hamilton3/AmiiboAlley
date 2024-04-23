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

    @total = @subtotal + @totalTaxes
  end

  def create
    if params[:quantities].blank?
      redirect_to root_path
      return
    end

    # Convert the amiibo and quantities to a hash.
    quantities = params[:quantities].permit!.to_h

    current_user_tax_rate = Province.find(current_user.provinceId).taxRate

    total_taxes = 0.0
    subtotal = 0

    # Loop through to get totals.
    quantities.map do |amiibo_id, quantity|
      amiibo = Amiibo.find(amiibo_id)

      tax_for_item = ((amiibo.price * 100) * current_user_tax_rate)

      total_taxes += tax_for_item * quantity.to_i

      subtotal += amiibo.price * quantity.to_i
    end

    total_taxes = total_taxes.round

    # Save data to the database (Orders.)
    order_date = Time.now
    order_user_id = current_user.id
    order_status = "new"
    order_total = subtotal + (subtotal * current_user_tax_rate)

    order_params = {
      orderDate: order_date,
      user_id: order_user_id,
      status: order_status,
      total: order_total
    }

    order = Order.new(order_params)

    order.save

    line_items = quantities.map do |amiibo_id, quantity|
      amiibo = Amiibo.find(amiibo_id)

      # Save each item to order_amiibos.
      order_amiibos_quantity = quantity.to_i
      order_amiibos_unitPrice = amiibo.price
      order_amiibos_order_id = order.id
      order_amiibos_amiibo_id = amiibo.id
      order_amiibos_tax_rate = current_user_tax_rate

      order_amiibos_params = {
      quantity: order_amiibos_quantity,
      unitPrice: order_amiibos_unitPrice,
      order_id: order_amiibos_order_id  ,
      amiibo_id: order_amiibos_amiibo_id,
      tax_rate: order_amiibos_tax_rate
      }

      order_amiibo = OrderAmiibo.new(order_amiibos_params)
      order_amiibo.save

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
      unit_amount: total_taxes,
      currency: 'cad',
      product_data: {
        name: "Total Taxes",
        description: "GST + PST + HST"
      }
    }
  }

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      billing_address_collection: 'required',
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}&order_id=#{order.id}",
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

    # Change the Order object in Database to status:paid, and then add stripe_id.
    order_id = params[:order_id]

    order = Order.find(order_id)

    order.status = "paid"
    order.stripe_id = @payment_intent.id

    order.save
  end

  def cancel
    # Handle cancelled transactions.
  end
end
