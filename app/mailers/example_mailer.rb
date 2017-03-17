class ExampleMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @order = order
    mail(
        to: 'email@example.com',
        subject: "Jungle Order Confirmation: Order \n##{@order.id}"
    )
  end
end
