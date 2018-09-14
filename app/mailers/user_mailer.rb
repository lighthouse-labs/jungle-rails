class UserMailer < ApplicationMailer
  # send a order confirmation email to the user, pass in the user object that contains the user's email address
  def send_order_email(order)
    @order = order
    @line_items = LineItem.where(order_id: order.id)
    mail(to: 'user@example.com',
    :subject => 'Thanks for shopping with Jungle' )
  end
end
