class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.where("order_id" => @order.id)
  end

  def product_info variable
    Product.find(variable.product_id)
  end
  helper_method :product_info

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)
    line_items = LineItem.where("order_id" => order.id)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
      UserMailer.welcome_email(order, order.line_items).deliver_now
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
