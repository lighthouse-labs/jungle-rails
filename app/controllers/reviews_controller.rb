class ReviewsController < ApplicationController
    before_filter :authorize_user
    def create
        puts "current user", current_user.inspect
        @review = Review.new params[:review].permit!
        @review[:user_id] = current_user.id
        @review[:product_id] = params[:product_id]
        puts @review.inspect
  
        
        puts "RIGHT HERRRRRRREEEEEEEEEEEEEEEEEEE"
        puts 
        if @review.valid?
            @review.save!
            puts "It was saved!!!!!!!!!!!!!!"
            redirect_to :back
        else

            redirect_to :back, alert: "Review can not be saved, please enter information."
        end
            
    end

    private

    def authorize_user
        unless User.find_by_id(session[:user_id])
            redirect_to login_url, :notice => "Please log in"
        end
    end


end
