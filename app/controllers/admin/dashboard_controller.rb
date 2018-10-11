class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USER_ID"], password: ENV["PASSWORD"]
  def show
  end
end
