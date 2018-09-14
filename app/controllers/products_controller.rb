class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where("product_id": params[:id])
    @review = Review.new
    @average = @reviews.average(:rating)
  end

  def product_ratings product
    reviews = Review.where("product_id": product.id)
    average = reviews.average(:rating)
  end

  helper_method :product_ratings
  def user_info variable
    User.find(variable.user_id)
  end
  helper_method :user_info

end
