class ReviewsController < ApplicationController
    def index
    end
    def show
    end
    def create
        @review = Review.new
    end
    def destroy
    end
    def new
        @review = Review.new
    end
    def edit
    end

end
