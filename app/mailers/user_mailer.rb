class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def email_receipt(order)
    @order = order
    @url  = 'localhost:3000'
    mail(to: order.email, subject: "Jungle order #{@order.id}")
  end
end
