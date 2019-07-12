class Admin::DashboardController < ApplicationController

  # login required for admin pages
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']

  def show
  end
end
