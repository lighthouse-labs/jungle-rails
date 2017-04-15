class ReviewsController < ApplicationController
  def create
    @review = Review.new(
                description: params[:review][:description],
                rating: params[:review][:rating],
                product_id: params[:product_id]
              )
    @review.user = current_user
    if @review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      redirect_to "/products/#{params[:product_id]}"
    end
  end
end