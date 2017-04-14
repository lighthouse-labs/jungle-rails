class ReviewsController < ApplicationController
  def create
    @review_params = params[:review]
    review = Review.new(product_id: params[:product_id], user_id: session[:user_id], description: @review_params["description"], rating: @review_params["rating"])
    if review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
