class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASS']
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :products], notice: 'Category created!'
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
