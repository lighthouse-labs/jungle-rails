class ReviewsController < ApplicationController
  before_filter :require_login
  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    # after @review has been initialized, but before calling .save on it:
    @review.user = current_user
    redirect_to "/products/" + @product.id.to_s if @review.save

  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to "/products/" + params[:product_id].to_s
  end

  private

  def require_login
    unless current_user
      redirect_to "/login"
    end
  end

   def review_params
    params.require(:review).permit(:description, :rating)
  end

end
