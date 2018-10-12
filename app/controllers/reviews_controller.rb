class ReviewsController < ApplicationController
  def create

  @product = Product.find(params[:product_id])
  new_review = @product.reviews.new(review_params)

  new_review.user=current_user

    if new_review.save
      redirect_to @product
    else
      redirect_to @product, notice:"error saving review"
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)

  end


  def destroy
    Review.destroy(params[:id])
    redirect_to :back
  end
end