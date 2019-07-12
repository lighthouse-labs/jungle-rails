class UserMailer < ApplicationMailer

  def order_receipt(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Order Receipt #{@order.id}')
  end

end
