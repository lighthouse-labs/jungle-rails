class ReviewsController < ApplicationController

  def create
    puts "SUCCESS"
    @product = Product.find(params.require(:product_id))
    if current_user
      @review = @product.reviews.new(review_params)

      # as of now there is no filter for a signed in user
      @review.user_id = current_user.id
      if @review.save
        redirect_to @product
      else
        send_error(@review.errors.full_messages)
        # flash[:send_error] = @review.errors.full_messages
        # redirect_to @product
      end
    else
      send_error(["Must be logged in!"])
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :user_id
    )
  end

  def send_error(msg)
    flash[:comment_error] = msg
    redirect_to @product
  end
end
