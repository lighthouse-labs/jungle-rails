class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'User created!'
    else
      # redirect_to new_user_path
      render :new
    end
  end 

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end

end
