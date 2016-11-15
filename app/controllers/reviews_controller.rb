class ReviewsController < ApplicationController
  before_action :require_login

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
    @review = Review.find(params[:id])
    get_product(params.require(:product_id))
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to @product
    else
      redirect_to root_path
    end
  end


  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

    def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to Product.find(params[:product_id])
    end
  end
end
