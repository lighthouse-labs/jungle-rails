class UsersController < ApplicationController
    def new
        
    end

    def create
        # user = User.new (
        #     name: params[:name],
        #     email: params[:email],
        #     password: params[:password],
        #     password_confirmation: params[:password_confirmation]
        # )
        @user = User.new(user_params)
        puts user_params
        puts @user

        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Succesfully registered your email"
            redirect_to '/'
        else 
            redirect_to '/register'
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
