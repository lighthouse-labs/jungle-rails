class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order(id: :desc).all
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

  def destroy
    @category = Category.find params[:id]
    begin
      @category.destroy
      flash[:notice] = 'Category deleted!'
    rescue => e
      flash[:error] = "Can't delete category when there are products within it"
    end
      redirect_to [:admin, :categories]
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
