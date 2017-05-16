class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
