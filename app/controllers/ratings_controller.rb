class RatingsController < ApplicationController

  def create

    @rating = Rating.new(content: params['rating']['content'], rating: params['rating']['rating'], user_id: session['user_id'],product_id: params['product_id'])
    if @rating.save
      id = params['product_id']
      redirect_to "/products/#{id}" , notice: "kill yoself"

    else
      redirect_to '/'
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy

    id = @rating.product_id
    redirect_to "/products/#{id}" , notice: "goodbye"
  end
end

