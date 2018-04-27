class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['ADMIN'], :password => ENV['MY_PASS']
  def show
  end
end
