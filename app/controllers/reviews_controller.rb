class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:id]
    puts @product
    
  end
end
