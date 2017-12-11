class ReviewsController < ApplicationController

  before_filter :authorize

  def create

    values = params[:review]

    review = Review.new do |d|

      d.user = current_user
      d.product_id = params[:product_id]
      d.description = values[:description]
      d.rating = values[:rating]
    end

    if review.save

      puts "hey right here"
      redirect_to "/products/#{params[:product_id]}", notice: 'New review created'


    else
      puts "else right here"
      # @product = Product.find(params[:product_id])
      # @review = Review.new
      redirect_to "/products/#{params[:product_id]}",error: review.errors.full_messages.first
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @review.product
  end
end
