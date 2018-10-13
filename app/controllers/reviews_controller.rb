class ReviewsController < ApplicationController

  
    

    def create

      @review = Review.new({
        product_id: params[:product_id],
        description: params[:review][:description],
        rating: params[:review][:rating] 
      })
      @review.user = current_user


      if @review.save
        redirect_to "/"
        
      else
        redirect_to @review.product
      end
    end
  

end
