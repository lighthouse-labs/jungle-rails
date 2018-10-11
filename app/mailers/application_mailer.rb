class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'erik.mackie@gmail.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
