class ReviewsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.create!(review_params)
    redirect_to "/products/#{product.id}"
  end

private

  def review_params
    params.require(:description, :rating)
  end

end
