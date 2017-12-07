# add admin category controller 
class Admin::CategoriesController < ApplicationController
    def index
      @categories = Category.order(id: :desc).all
    end

    def new
      # new.html.erb
      @category = Category.new
    end

    def show
      # automatically render html
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to [:admin, :categories], notice: 'category created!'
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
