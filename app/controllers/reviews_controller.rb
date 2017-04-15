class ReviewsController < ApplicationController
  before_action :require_login

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

  def destroy
    @review = Review.find params[:id]
    if @review.destroy
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url
    end
  end

end