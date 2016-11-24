class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      #save the user id inside the browser cookie.
      # This is how the user stays logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    # else if user's login doesnt work, send them back to the login form
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
