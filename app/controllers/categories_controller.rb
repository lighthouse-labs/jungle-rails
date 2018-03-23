class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def create
    @category = Category.create(params[:name])
  end

end
