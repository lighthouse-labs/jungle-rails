class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.order_success.subject
  #
  def order_success
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
