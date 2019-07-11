class UserMailer < ApplicationMailer

default from: 'no-reply@jungle.com'

  def welcome_email(current_user)
    @user = current_user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
