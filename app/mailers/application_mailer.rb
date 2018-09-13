class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  # send a order confirmation email to the user, pass in the user object that contains the user's email address
  def send_order_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for shopping at Jungle' )
  end

end
