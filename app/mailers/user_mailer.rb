class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def welcome_email(order, line_items)
    @order = order
    @line_items = line_items
    mail(to: @order.email, subject: "Order ##{@order.id}")
  end

  def product_info variable
    Product.find(variable.product_id)
  end
  helper_method :product_info
end