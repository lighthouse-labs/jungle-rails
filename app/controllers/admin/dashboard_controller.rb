class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret"
  def show
  end
end
