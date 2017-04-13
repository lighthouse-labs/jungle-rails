class ReviewsController < ApplicationController
   before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @product, notice: "Review saved!"
    else
      render "products/show"
    end
  end

  def destroy
    @reviewd = Review.find params[:id]
    @reviewd.destroy
    redirect_to "/products/#{params[:product_id]}", notice: 'Review deleted'
  end

  private
    def review_params
      params.require(:review).permit(
        :product_id,
        :description,
        :rating)
    end


end