class ReviewsController < ApplicationController
  def create
    @review.save
    redirect_to :back
  end

end
