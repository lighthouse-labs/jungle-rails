class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        UserMailer.thank_you(@user).deliver_later
        respond_to do |format|
          format.html { redirect_to '/', notice: "User was successfully created." }
        end
      else
      redirect_to '/signup'
      end
  end

private

  def user_params
    params.require(:user).permit(:first, :last, :email , :password, :password_confirmation)
  end



end
