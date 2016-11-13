class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to :back
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    puts "*********************** IN DESTROY ***********************"
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] ='Review deleted!'
    redirect_to :back
  end

  private

    def review_params
      params.require(:review).permit(:description, :rating)
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to '/login'
      end
    end
end

