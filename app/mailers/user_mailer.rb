class UserMailer < ApplicationMailer
  default from: 'admin@jungle.ca'

  def orderconf_email(user)
    @user = user
    @url = 'http://localhost/login'
    mail(to: @user.email, subject: 'Jungle Store! The best in the world')
  end
end