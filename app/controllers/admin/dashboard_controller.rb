class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMINISTRATOR"], password: ENV["PASSWORD"]

  def show
  end
end
