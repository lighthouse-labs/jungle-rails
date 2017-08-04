class RecieptMailerPreview < ActionMailer::Preview
  def reciept_email
    RecieptMailer.reciept_email(Order.first)
  end
end