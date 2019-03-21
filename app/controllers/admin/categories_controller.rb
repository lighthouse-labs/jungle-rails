class Admin::CategoriesController < ApplicationController


    # GET /admin/categories (action) #references Category class
    def index
        @categories = Category.all.order(id: :desc)
    end

end
