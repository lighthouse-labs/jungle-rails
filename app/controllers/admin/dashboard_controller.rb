class Admin::DashboardController < ApplicationController
  # TODO: move the authentication somewhere else to DRY it up
  http_basic_authenticate_with name: ENV['ADMIN_BASIC_AUTH_USERNAME'], password: ENV['ADMIN_BASIC_AUTH_PASSWORD']

  def show
  end
end
