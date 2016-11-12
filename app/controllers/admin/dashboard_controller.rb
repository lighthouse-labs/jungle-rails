class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_UN'], password: ENV['ADMIN_PW']

  def show
  end
end
