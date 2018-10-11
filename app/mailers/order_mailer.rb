class OrderMailer < ActionMailer::Base
  def send_receipt(order_id)
    load_order(order_id)
    mail(to: @order.email, subject: 'Order has been received')
  end

  def send_shipping_details(order_id)
    load_order(order_id)
  end

  private

  def load_order(id)
    @order = Order.find(id)
  end
end