class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt_email(user)
    @user = user
    main(to: @user.email, subject: "Jungle Order #{@order.id} Summary")
  end
end
