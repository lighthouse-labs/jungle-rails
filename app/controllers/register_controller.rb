class RegisterController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # @user = User.new (
        #     name: params[:name],
        #     email: params[:email],
        #     password: params[:password],
        #     password_confirmation: params[:password_confirmation]
        # )
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Succesfully registered your email"
            redirect_to root_path
        else 
            redirect_to '/users'
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
