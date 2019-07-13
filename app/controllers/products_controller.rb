class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.all.each do |r| 
      if r.product_id == @product.id 
        r
      end
    end
  end


end
