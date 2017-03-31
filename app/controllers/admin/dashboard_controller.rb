class Admin::DashboardController < ApplicationController
    http_basic_authenticate_with name: ENV['BANAME'], password: ENV['BAPASS']

  def show
  end
end
