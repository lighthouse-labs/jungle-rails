class ReviewsController < ApplicationController
  before_filter :authorize
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params.require(:product_id)
    @review.user = current_user
    @review.user_id = session[:user_id]
    @review.save
        redirect_to "/products/#{params[:product_id]}"
  end

  def destroy
    @review = Review.find(params[:id])
    @review.product_id = params.require(:product_id)
    @review.user = current_user
    @review.destroy
      redirect_to "/products/#{params[:product_id]}", notice: 'Your review was deleted!'
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
