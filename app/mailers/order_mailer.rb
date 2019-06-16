class OrderMailer < ApplicationMailer

  def receipt(id)
    @order = Order.find(id)
    mail(to: @order.email, subject: "Your order (##{id}) has been proccessed")
  end
end
