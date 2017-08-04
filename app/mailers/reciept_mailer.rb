class RecieptMailer < ApplicationMailer
  default from: "no-reply@sandboxb6061b6e7f984f7c9e01f2a9c95dbb12.mailgun.org"
  layout 'mailer'

  def reciept_email(order)
    @order = order
    mail to: ENV['TEST_EMAIL_TO_SEND'], subject: "Your Order at Jungle - # #{ @order.id }"
  end
end
