class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with username: ENV['ADMIN-USERNAME'], password: ENV['ADMIN-PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def categories_params
    params.require(:category).permit(
      :name
      # :description,
    )
  end

end
