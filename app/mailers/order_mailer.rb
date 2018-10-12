class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def reciept_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end