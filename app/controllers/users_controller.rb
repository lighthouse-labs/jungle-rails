class UsersController < ApplicationController

  def new
  end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    UserMailer.welcome_email(user).deliver_now
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end

  private

  def user_params
    params.require(:user).permit(
      :last_name,
      :first_name,
      :password,
      :password_confirmation,
      :email
    )
  end

end
