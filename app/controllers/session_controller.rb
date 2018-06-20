class SessionController < ApplicationController

  def new
  end

  def create
    #finding the user by email search
    user_login = User.find_by_email(param[:email])
    #if user exist and the password is correct create a session with the user_id
    if user_login && user_login.authenticate(param[:password])
      session[:user_id] = user_login.user_id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    #Reset the variable user_id from the user session and redirect to the login page
    session[user_id] = nil
    redirect_to '/login'
  end

end