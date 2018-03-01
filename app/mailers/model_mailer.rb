class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.order_success.subject
  #
  def order_success
    mg_client = Mailgun::Client.new ENV['MAILGUN_KEY']
    message_params = {:from => ENV['MAILGUN_USERNAME'],
                      :to => 'thulsmans.2994@me.com',
                      :subject => 'hello',
                      :text => 'stuffhere'}
    mg_client.send_message ENV['MAILGUN_DOMAIN'], message_params
  end
end
