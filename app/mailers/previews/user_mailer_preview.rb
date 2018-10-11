
class UserMailerPreview < ActionMailer::Preview
  def order_confirmation_email
    JungleMailer.with(user: User.first).order_confirmation_email
  end
end