class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
          # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver_now
        format.json { render json: @user, status: :created, location: @user}
        format.html { redirect_to root_path }
      else
        format.html { render 'new' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :password,
      :password_confirmation,
      :email
    )
  end
end
