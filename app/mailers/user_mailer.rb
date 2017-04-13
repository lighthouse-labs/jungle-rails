class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_successful_email(user)
    @user = user
    main(to: @user.email, subject: "Jungle Order #{@order.id} Summary")
  end
end
