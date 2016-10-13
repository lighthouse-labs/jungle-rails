class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(user, order)
    @user = user
    @order = order

    if mail(to: @user.email, subject: "Order Receipt: #{@order.id}")
      puts "Sent to #{@user.email}!"
    end
  end
end
