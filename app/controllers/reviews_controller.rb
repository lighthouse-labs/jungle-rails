class ReviewsController < ApplicationController
  # def new
  #   @review = Review.new
  #   @product = product.find(params[:product_id])
  # end
  def create
    puts review_params
    @review = Review.new(review_params)
    @review.product_id = params["product_id"] ## GET SECOND OPINION
    if @review.save
      redirect_to :back
    else
      # redirect_to home,
      # error: order.errors.full_messages.first
      puts @review.errors.to_a
    end
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating)
    end
end
