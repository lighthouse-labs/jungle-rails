class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER'], password: ENV['HTTP_AUTH_PASS']

  def index
  end

  def new
  end

  def create
  end
end
