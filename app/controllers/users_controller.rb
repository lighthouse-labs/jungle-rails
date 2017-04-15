class UsersController < ApplicationController
  def new
  end

  def create
    @user_data = params[:user]
    if !User.exists?(email: @user_data[:email])
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    else
      redirect_to '/signup'
    end


  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
