class ReceiptMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_email(order)
        @order = order
        mail(to: @order.email, subject: 'Order #{@order.id} Details')
    end
end

