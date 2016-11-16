class ReviewsController < ApplicationController
  before_action :authenticate

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product
    else
      flash[:error] = @review.errors.full_messages[0]
      redirect_to @product
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

    def authenticate
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to Product.find(params[:product_id])
    end
  end
end
