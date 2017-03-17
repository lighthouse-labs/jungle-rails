class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to '/signup'
    end
  end
  def destroy
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end