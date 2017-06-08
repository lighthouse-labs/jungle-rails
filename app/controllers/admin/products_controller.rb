class Admin::ProductsController < ApplicationController
  http_basic_authenticate_with username: ENV['ADMIN-USERNAME'], password: ENV['ADMIN-PASSWORD']

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    # @prodhttp_basic_authenticate_with name: "dhh", password: "secret"http_basic_authenticate_with name: "dhh", password: "secret"http_basic_authenticate_with name: "dhh", password: "secret"http_basic_authenticate_with name: "dhh", password: "secret"http_basic_authenticate_with name: "dhh", password: "secret"http_basic_authenticate_with name: "dhh", password: "secret"uct = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
