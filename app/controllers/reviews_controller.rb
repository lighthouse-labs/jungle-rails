class ReviewsController < ApplicationController
    def create
        @review = Product.find(params[:product_id]).reviews.new(review_params)
        # @review.user = current_user
    
        # if @review.save
        #     redirect_to product_path params[:product_id]
        # else
        #     render :new
        # end
    end
    
    def destroy
        @review = Review.find(params['id'])
        @review.destroy
        redirect_to product_path(@review.product)
    end
    
    private
    
    def review_params
        params.require(:review).permit(
            :description,
            :rating
        )
    end
end
