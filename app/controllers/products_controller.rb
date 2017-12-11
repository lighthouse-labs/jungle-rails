class ProductsController < ApplicationController



  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id])
    @review =  Review.new
  end

  def new
    @review = Review.new
  end


end
