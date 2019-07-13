class ReviewsController < ApplicationController

  def create

    # get associated product
    @product = Product.find_by(id: params[:product_id])

    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    @review.save!
    redirect_to product_path(@product)

  end

  private

  def review_params
    params.require(:review).permit(
      :product_id,
      :description,
      :rating,
      :user_id
    )
  end

end
