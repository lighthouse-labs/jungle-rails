
class UserMailerPreview < ActionMailer::Preview
  def order_confirmation_email
    UserMailer.with(user: User.first).order_confirmation_email
  end
end