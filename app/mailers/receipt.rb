class Receipt < ApplicationMailer

  def order_email(recipient, order)
    @order = order
    mail(to: recipient, subject: "Your order with ID #{@order.id} was successful.")
  end

end