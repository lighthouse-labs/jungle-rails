class RatingsController < ApplicationController
  def create
    myProd = Product.find params['product_id']
    newRating = myProd.ratings.create({
      user_id: current_user.id,
      rating: params['rating'],
      description: params['message']
    })
    if newRating.id.present?
      redirect_to '/'
    else
      redirect_to :back
    end
  end

  def destroy
    Rating.find(params['id']).destroy
    redirect_to "/products/#{params['product_id']}"
  end
end
