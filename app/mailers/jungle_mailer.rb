ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :authentication => :plain,
    :user_name => "junglerailstest@gmail.com",
    :password => "H4kunamatata",
    :enable_starttls_auto => true
}
class JungleMailer < ApplicationMailer
  default from: 'junglerailstest@gmail.com'
 
  def order_confirmation_email(email, order_id, order)
    @current_order = order
    mail(to: email, subject: order_id,content_type: 'text/html; charset=UTF-8')
  end
end
