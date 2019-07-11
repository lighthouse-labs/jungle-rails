class UserMailer < ApplicationMailer

default from: 'no-reply@jungle.com'

  def order_confirm(order)
    @order_details = order
    mail(to: @order_details.email, subject: "Order Confirmation #{@order_details.id}")
  end

end
