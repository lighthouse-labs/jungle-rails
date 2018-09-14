class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where("product_id": params[:id])
    @review = Review.new
  end

  def user_info variable
    User.find(variable.user_id)
  end
  helper_method :user_info

end
