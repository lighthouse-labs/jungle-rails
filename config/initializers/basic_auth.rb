Rails.application.config.basic_auth = {
  :user          => ENV['ADMIN_USERNAME'],
  :password      => ENV['ADMIN_PASSWORD']
}