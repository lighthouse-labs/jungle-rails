class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def order_receipt(order)
    @order = order
    mail(to: order.email, subject: 'Your order reciept: #{@order.id}')
  end
end
