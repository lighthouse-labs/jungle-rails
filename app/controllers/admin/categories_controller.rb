class Admin::CategoriesController < ApplicationController


    # GET /admin/categories (action) #references Category class
    def index
        @categories = Category.all.order(id: :desc)
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
      :name,
    )
  end

end
