class SessionsController < ApplicationController

  def create
    flash.clear
    user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:session][:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      flash[:error] = "username or password incorrect"
      redirect_to "/"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
