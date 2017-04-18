class SessionsController < ApplicationController
  # login form
  def new
  end

  # to login
  def create
    # authenticate email-password combination (after email stripped of whitespace)
    if user = User.authenticate_with_credentials(params[:email].strip, params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  # to logout
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
