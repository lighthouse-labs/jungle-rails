class Admin::ImagesController < ApplicationController

  def new
    @product = Product.find params[:product_id]
    @image = Image.new
  end

  def create
    @product = Product.find params[:product_id]
    @image = @product.images.new(image_params)

    if @image.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
