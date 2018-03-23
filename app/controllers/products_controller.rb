class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # @reviews = @product.reviews.find_by(product_id: @product.id)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews
  end

end
