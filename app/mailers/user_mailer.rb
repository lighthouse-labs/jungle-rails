class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def thank_you(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def welcome(email)
    @email = email
    @url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end
end
