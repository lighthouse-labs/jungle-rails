class ReviewsController < ApplicationController

  def create
    get_product(params.require(:product_id))
    if !current_user.nil?
      @review = @product.reviews.new(review_params)
      # as of now there is no filter for a signed in user
      @review.user_id = current_user.id
      if @review.save
        redirect_to @product
      else
        send_error(@review.errors.full_messages)
      end
    else
      send_error(["Must be logged in!"])
    end
  end

  def destroy
    @review = Review.find params[:id]
    get_product(params.require(:product_id))
    # only destroy if session user matches the review
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to @product
    else
      redirect_to root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :user_id
    )
  end

  def send_error(msg)
    flash[:comment_error] = msg
    redirect_to @product
  end

  def get_product(params)
    @product = Product.find(params)
  end
end
