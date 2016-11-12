class ReviewsController < ApplicationController

  def create
    puts "SUCCESS"
    @product = Product.find(params.require(:product_id))
    @review = @product.reviews.new(review_params)
    # @review = Review.new(review_params)

    # as of now there is no filter for a signed in user
    @review.user_id = current_user.id
    if @review.save
      redirect_to @product
    else
      flash[:error] = @review.errors.full_messages
      redirect_to @product
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
