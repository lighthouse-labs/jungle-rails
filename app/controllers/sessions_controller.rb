class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
    redirect_to '/login'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end


end
