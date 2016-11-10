class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id

      respond_to do |format|
        if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.thank_you(@user).deliver_later

        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end




    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end



