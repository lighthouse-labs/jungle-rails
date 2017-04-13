class SessionsController < ApplicationController
  # login form
  def new
  end

  # to login
  def create
    user = User.find_by_email(params[:email])
    # if user exists and password is correct, make cookie with user.id
    if user && user.authenticate(params[:password])
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
