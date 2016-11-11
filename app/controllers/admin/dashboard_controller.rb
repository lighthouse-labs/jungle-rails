class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "hunter2"
  def show
  end
end
