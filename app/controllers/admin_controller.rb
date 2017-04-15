# So the admin controllers can inherit from this base controller
class AdminController < ApplicationController
  # authentication filter so only admin can see admin pages
  http_basic_authenticate_with name: ENV['ADMIN_BASIC_AUTH_USERNAME'], password: ENV['ADMIN_BASIC_AUTH_PASSWORD']
end
