class ProductsController < ApplicationController

  def index
    
    @products = Product.all.order(created_at: :desc)
    
  end

  def show
    @product = Product.find params[:id]
    @review = @product.reviews.new
    
    @current_user = current_user
  end

 def average_rating(product_id)
    reviews = Review.where(product_id: product_id)
    count = 0
    total_rating = 0
    average_rate = 0
    
    reviews.each do |review|
      count += 1
      total_rating += review.rating 
      average_rate = (total_rating / count).round 
    end
    puts average_rate
    average_rate
  end
  helper_method :average_rating
  
end
