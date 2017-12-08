class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:session][:email])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            @current_user = session[:user_id]
            redirect_to root_path
        else
            redirect_to root_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    def session_params
        params.require(:session).permit(
            :email,
            :password
        )
    end
end