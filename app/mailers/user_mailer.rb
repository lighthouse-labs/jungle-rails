class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def line_item
    @line_item ||= @order.line_items.all.map{|item| { product: item.product, quantity: item.quantity } }
  end
  helper_method :line_item
  
  def line_item_subtotal
    line_item.map{|item| item[:product].price_cents * item[:quantity]}.sum
  end
  helper_method :line_item_subtotal
  
  
  def order_email (order)
    
    @order = order
    puts "-----------#{order}----------------"
    mail(to: "dan.zajac@mac.com", subject: 'Jungle Order Submitted')
  end
end
