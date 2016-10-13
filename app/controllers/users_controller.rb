class UsersController < ApplicationController
  include BCrypt

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      session[:user_id] = nil
      flash[:error] = 'An error occured!'
      redirect_to '/login'
    end
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation)
  end

end
