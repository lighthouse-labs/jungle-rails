class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all.order(created_at: :desc)


  end

  # GET /products/:id
  def show
    @product = Product.find params[:id]
    @images = @product.images
    # render :show
  end

end
