class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_email(order)
    puts "Got to user_mailer"
    # @user = user
    @order = order
    # @url = "http://localhost:3000/orders"
    mail(to: @order.email, subject: @order.id)
  end
end
