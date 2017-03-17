class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with username: "Jungle", password: "book"
  def show
  end
end
