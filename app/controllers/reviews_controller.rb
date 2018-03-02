class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]
    puts @review.user

    if @review.save!
      redirect_to [:products], notice: 'review added'
    else
      raise ':('
    end
  end

  private

  def review_params
       params.require(:review).permit(
      :rating,
      :description,
      :product_id
      )
  end
end
