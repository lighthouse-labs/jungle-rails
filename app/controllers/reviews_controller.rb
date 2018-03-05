class ReviewsController < ApplicationController

  before_filter :check_login

  def create

    product = Product.find(params[:product_id])

    review = params[:review]
    
    new_review = product.reviews.create({
      user_id: current_user.id,
      rating: review[:rating],
      description: review[:description]
    })

    if new_review.save
      redirect_to product, notice: 'Review Posted!'
    else
      redirect_to product, notice: 'Review not posted, Error!'
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    @review = Review.find params[:id]

    if current_user.id == @review.user_id
      @review.destroy
      redirect_to product, notice: 'Review Deleted!'
    else
      redirect_to product, notice: 'You are not allowed to delete other users reviews'
    end
  end

  private

  def check_login
    if current_user
      true     
    else
      redirect_to :root, notice: 'Incorrect Action, please login!'
      false
    end
  end 


end


# Parameters: {"utf8"=>"✓", "authenticity_token"=>"TXxWs7bVEMHKR3LpKevUrEom53hTb5wjg6yGSL+82SPV334V9mFydLFATxf2vbCE1Z/vDuyopvME05+0rRRFsA==", "review"=>{"rating"=>"1", "description"=>"sdfds"}, "commit"=>"Post Review", "product_id"=>"12"}
