class UsersController < ApplicationController

  def new
    @products = Product.all.order(created_at: :desc)
  end

  def create
    user = User.new(user_param)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signin'
  end

  def user_param
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
end