class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Receipt for #{order.id}")
  end

end
