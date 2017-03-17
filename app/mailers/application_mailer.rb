class ApplicationMailer < ActionMailer::Base
  default from: "reply-to@gmail.com"
  layout 'mailer'
end
