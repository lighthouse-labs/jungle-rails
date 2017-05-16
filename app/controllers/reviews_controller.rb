class ReviewsController < ApplicationController

  before_filter :authorize_user

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product), :notice => 'Review was successfully created.' }
      else
        format.html { render 'products/show' }
      end
    end
  end

  def destroy

    @product = Product.find(params[:product_id])
    @review = Review.find params[:id]

      @review.destroy
      redirect_to product_path(@product)

  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def authorize_user
    if !current_user
      redirect_to root_path, notice: "Log in!"
    end
  end
end