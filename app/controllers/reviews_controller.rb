class ReviewsController < ApplicationController
before_filter :has_user
  def create
    @review = Review.create(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]
    puts @review.user

    if @review.save!
      redirect_to :back
    else
      raise ':('
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to [:products]
  end

  private

  def review_params
       params.require(:review).permit(
      :rating,
      :description,
      :product_id
      )
  end

  def has_user
    if !current_user
      redirect_to [:products]
    end
  end
end
