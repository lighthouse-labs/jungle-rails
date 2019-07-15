class SessionsController < ApplicationController
    def new
    end
    
    def create
        if user = User.authenticate_with_credentials(params[:email], params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
            flash.now[:error] = "Invalid username or password"
            redirect_to '/login'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "You Logged out successfully"
        redirect_to '/'
    end
    
    private
    
    def login_user!(user)
        session[:user_id] = user.id
        flash[:notice] = "Welcome, you're now logged in"
        redirect_to '/'
    end
    
end
