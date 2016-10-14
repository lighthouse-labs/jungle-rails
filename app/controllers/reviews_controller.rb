class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    puts review_params
    @product = Product.find(params["product_id"])
    @review = Review.new(review_params)
    @review.product_id = params["product_id"]
    @review.user_id = @current_user.id
    @review.rating = params["rating"].to_i ## GET SECOND OPINION
    if @review.save
      redirect_to :back
    else
      puts @review.errors.to_a
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
