class Admin::CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
end
