class Admin::DashboardController < ApplicationController
http_basic_authenticate_with name: ENV['ADMIN_PASSWORD'], password: ENV['ADMIN_USERNAME']
  def show
  end
end
