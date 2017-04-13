class UserMailerPreview < ActionMailer::Preview
  def receipt_email
    UserMailer.receipt_email(User.first)
  end
end