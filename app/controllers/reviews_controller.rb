class ReviewsController < ApplicationController

  # to redirect users who are not logged in
  before_filter :authorize

  def new
  end

  def create
    @product = Product.find(params['product_id'])
    review = Review.new({
      product_id: params['product_id'],
      user_id: current_user['id'],
      description: params['review']['description'],
      rating: params['review']['rating']
    })

    if review.save
      redirect_to :back
    else
      redirect_to :back
      # TODO add a message or something to warn user that review was not saved
      #  supposed to 'render the page where the form resides'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back
  end
end
