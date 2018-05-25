class SessionsController < ApplicationController
    def new
    end

    def create
      @existinguser = User.find_by_email(params[:email])

      if @existinguser && @existinguser.authenticate(params[:password])
        session[:user_id] = @existinguser.id
        redirect_to [:products]
      else
        redirect_to [:new, :sessions]
      end
    end

  def destroy
    session[:user_id] = nil
    redirect_to [:new, :session]
  end

end
