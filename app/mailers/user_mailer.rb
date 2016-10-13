class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(user)
    @user = user
    @url = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Order Receipt')
  end
end
