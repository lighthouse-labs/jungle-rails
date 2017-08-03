class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(id: :desc).all
  end
end
