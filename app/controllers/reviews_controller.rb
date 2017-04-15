class ReviewsController < ApplicationController

  before_filter :authorize

  def authorize
    redirect_to '/' unless current_user
  end

  def create
    @review_params = params[:review]
    review = Review.new(product_id: params[:product_id], user_id: session[:user_id], description: @review_params["description"], rating: @review_params["rating"])
    if review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to :back
  end
end
