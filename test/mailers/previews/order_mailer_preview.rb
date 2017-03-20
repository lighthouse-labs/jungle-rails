class OrderMailerPreview < ActionMailer::Preview
  def conf_email
    OrderMailer.conf_email(Order.first)
  end
end