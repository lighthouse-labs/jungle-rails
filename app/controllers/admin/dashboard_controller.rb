class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASS']
  def show
    render plain: "Everyone can see me: "
  end

  def others
    render plain: 'Can\'t see me though'
  end
end
