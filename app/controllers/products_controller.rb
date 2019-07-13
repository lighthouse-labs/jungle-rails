class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # get the associated reviews
    @product_reviews = Review.where(product_id: params[:id])
      .order(id: :desc)
  end

end
