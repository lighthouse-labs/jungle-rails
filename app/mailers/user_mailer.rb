class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order)
    # @user = user
    @order = order
    # @url = "http://localhost:3000/orders"
    mail(to: @order.email, subject: "Your Jungle Order (#{@order.id})")
  end
end
