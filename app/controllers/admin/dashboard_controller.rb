class Admin::DashboardController < ApplicationController
  http_basic_authenicate_with name: ENV['HTTP_AUTH_NAME'].password['HTTP_AUTH_PASS']
  
  def show
  end
end
