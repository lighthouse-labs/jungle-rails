class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def thanks_for_order(email,orderNumber)
    @email = email
    @url  = 'http://localhost:3000'
    @orderNumber = orderNumber
    mail(to: @email, subject: "Order # #{orderNumber}")
  end
end
