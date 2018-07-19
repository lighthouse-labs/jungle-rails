class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user;
    mail(to: @user.email, subject: 'Welcome to the Jungle!!')
  end

  def receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Your order receipt.')
  end


end
