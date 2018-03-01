class ReviewsController < ApplicationController

  def create
    
    before_filter check_login

    product = Product.find(params[:product_id])

    review = params[:review]
    
    new_review = product.reviews.create({
      user_id: current_user.id,
      rating: review[:rating],
      description: review[:description]
    })

    new_review.save

    redirect_to product, notice: 'Review Posted!'

  end

  private

  def check_login
    if !current_user?
      render :new
    end
  end 


end


# Parameters: {"utf8"=>"✓", "authenticity_token"=>"TXxWs7bVEMHKR3LpKevUrEom53hTb5wjg6yGSL+82SPV334V9mFydLFATxf2vbCE1Z/vDuyopvME05+0rRRFsA==", "review"=>{"rating"=>"1", "description"=>"sdfds"}, "commit"=>"Post Review", "product_id"=>"12"}
