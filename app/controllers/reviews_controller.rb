class ReviewsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @review = product.reviews.new(review_params)
    if current_user
      @review.user_id = current_user.id
      if @review.save
        redirect_to "/products/#{product.id}"
      end 
    else
      redirect_to "/login"
    end
  end

private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
