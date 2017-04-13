class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def email_receipt(order)
    mail(to: "dacehunter@gmail.com", subject: 'Order Receipt')
  end
end
