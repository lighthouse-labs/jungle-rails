class UserMailer < ApplicationMailer

def welcome_email(order)
    @order = order
    # @url  = 'http://example.com/login'
    mail(to: @order.email, subject: "Thanks for your order #{@order.id}")
  end
end
