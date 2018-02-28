class Admin::CategoriesController < ApplicationController
  def index
    @categories =  Category.order(id: :desc).all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :products], notice: 'Category Created!'
    else
      render :new
    end
  end


  private
  def category_params
    params.require(:cateogry).permit(
      :name
      )
end
