class Admin::CategoriesController < ApplicationController
  
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'].to_s, password: ENV['AUTH_PASSWORD'].to_s


  # Notice the categories plural
  def index
    @categories = Category.order(name: :asc).all
  end
# Notice the singular category
  def new
    @category = Category.new
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :category], notice: 'Category deleted!'
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end

end
