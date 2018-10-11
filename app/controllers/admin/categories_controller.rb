class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["USER_ID"], password: ENV["PASSWORD"]
# Require authentication only for edit and delete operation
   before_filter :authenticate, :only => [ :edit, :delete
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
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
      :name
    )
  end

end
