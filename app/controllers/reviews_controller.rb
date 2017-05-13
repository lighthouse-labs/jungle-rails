class ReviewsController < ApplicationController
  before_filter :authorize 

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = Product.find params[:product_id]

    if @review.save
      redirect_to @review.product, notice: 'Review Posted!'
    else
      @product = @review.product
      render "products/show"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @product = @review.product
    @review.destroy
    redirect_to @product, notice: 'Review deleted!'
  end
  
  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

end
