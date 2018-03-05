class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.order_success.subject
  #
  def order_success(order, line_items)
    @order = order
    @line_items = line_items
    puts 'ad;lkfjad;lkfjas;ldfkja;dslkfja;ldfkja;dlfj'
    puts @line_items
    mg_client = Mailgun::Client.new ENV['MAILGUN_KEY']
    message_params = {:from => ENV['MAILGUN_USERNAME'],
                      :to => ENV['MAILGUN_TARGET_ADDRESS'],
                      :subject => "order id: #{order.id}",
                      :html => (render_to_string(template: "../views/model_mailer/order_success")).to_str}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
