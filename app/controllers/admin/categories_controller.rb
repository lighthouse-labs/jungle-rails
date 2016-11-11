class Admin::CategoriesController < ApplicationController
  extend AdminHelper
  Admin::CategoriesController.authenticate_with

  def index
    @categories = Category.all()
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category saved"
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
