class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @product_reviews = @product.reviews
    @product_id = params[:id]
  end


end
