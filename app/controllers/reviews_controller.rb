class ReviewsController < ApplicationController


  def create

    @product = Product.find params[:product_id]
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to @product
    else
      redirect_to @product
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
