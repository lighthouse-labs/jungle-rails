class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to :back, notice: 'Review created!'
    else
      redirect_to :back, notice: 'Review not saved'
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Review deleted!'
  end

  private
  def require_login
    unless current_user
      flash[:error] = 'You must be logged in to leave a review'
      redirect_to '/login'
    end
  end
end


