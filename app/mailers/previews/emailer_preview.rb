class EmailerPreview < ActionMailer::Preview

  def order_email( user: user, order: order)
    @user = user
    @order = order
    mail(to: user.email , subject: "Order \# #{@order.id} has been received")
  end

end
