class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user
    @review.product = @product

    puts "WEEE HEREEE" + @review.inspect
    @review.save
    redirect_to @product
  end

  def destroy
    @review = Review.find params[:id]
    if @review.destroy
      redirect_to :back
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
