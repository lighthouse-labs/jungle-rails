class ReviewsController < ApplicationController

  def create
    puts "SUCCESS"
    @product = Product.find(params.require(:product_id))
    @review = @product.reviews.new(review_params)
    # @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product
    else
      render @review
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end
end
