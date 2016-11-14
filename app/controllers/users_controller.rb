class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
       if @user.save
          redirect_to '/'
       else
        flash[:error] = @user.errors.full_messages
        redirect_to '/signup'
       end

  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
