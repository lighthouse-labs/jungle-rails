class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def conf_email(order)
    @order = order
    mail(
      to: 'email@example.com',
      subject: "Jungle Order Confirmation : Order \n##{order.id}")
  end
end