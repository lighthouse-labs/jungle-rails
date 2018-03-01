class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  #def current_user
   # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  #helper_method :current_user

  def authorize
    redirect_to '/sessions/new' unless current_user
  end

  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

  protected

          def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
        end

end
