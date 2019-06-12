class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(user, orderID)
    mail(to: user.email, subject: "Receipt for #{orderID}")
  end

end
