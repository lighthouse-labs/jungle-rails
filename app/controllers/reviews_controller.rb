class ReviewsController < ApplicationController

  before_filter :current_user, :only => [:create, :destroy]
    

  def create
    
    @review = Review.new({
      product_id: params[:product_id],
      description: params[:review][:description],
      rating: params[:review][:rating] 
    })
    @review.user = current_user


    if @review.save
      redirect_to @review.product
      
    else
      redirect_to @review.product
    end
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to Product.find params[:format]
  end
end
