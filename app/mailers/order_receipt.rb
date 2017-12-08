class OrderReceipt < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = user
    mail(to: @order.email, subject: "Order confirmation ##{@order.id}")
  end
end
