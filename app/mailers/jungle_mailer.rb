class JungleMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_confirmation_email
    mail(to: current_user.email, subject: "hello")
  end
end
