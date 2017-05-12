class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'


  def welcome_email(user, order)
    @order = order
    @user = user
    mail(to: @user.email, subject: 'Order Receipt')
  end
end
