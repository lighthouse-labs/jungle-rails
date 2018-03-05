class Admin::CategoriesController < ApplicationController
  before_filter :restrict_user_by_role
  def index
    @categories = Category.order(id: :desc).all
    puts @categories
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
    params.require(:category).permit(
      :name
      )
  end

  def restrict_user_by_role
      if current_user.admin == false
        redirect_to '/'
      end
    end
end
