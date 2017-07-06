class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

end
