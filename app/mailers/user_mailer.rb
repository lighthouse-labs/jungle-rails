class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def successful_order_email(user_email, order)
    @user_email = user_email
    @order = order
    @url  = 'http://jungle.com'
    mail(to: @user_email, subject: "Order number #{@order.id} was successfully placed")
  end

end
