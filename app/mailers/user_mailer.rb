class UserMailer < ApplicationMailer

  def order_placed_email(order)
    @order = order
    @url  = 'http://localhost:3000/'
    mail(to: @order.email, subject: 'Jungle-order: #{@order.id}')
  end

end
