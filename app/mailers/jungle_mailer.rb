
class JungleMailer < ApplicationMailer
  default from: 'junglerailstest@gmail.com'
 
  def order_confirmation_email(email, order_id, order)
    @current_order = order
    mail(to: email, subject: order_id,content_type: 'text/html; charset=UTF-8')
  end
end
