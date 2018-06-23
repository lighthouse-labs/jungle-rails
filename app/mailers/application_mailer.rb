class ApplicationMailer < ActionMailer::Base
  default from: "admin@jungle.ca"
  layout 'mailer'
end