class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ADMIN_USERNAME, password: ADMIN_PASSWORD
  def show
  end
end
