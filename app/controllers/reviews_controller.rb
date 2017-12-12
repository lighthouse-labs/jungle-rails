class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    did_save = @review.save
    p params
    if did_save
      redirect_to :back, notice: 'Thanks for your review!'
    else
      redirect_to :back, notice: 'Something went wrong. Please try again.'
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      redirect_to :back, notice: 'Review was successfully destroyed.'
    end
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:product_id, :user_id, :description, :rating)
    end

end
