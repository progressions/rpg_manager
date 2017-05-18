class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_accessor :current_user

  private

    def requires_authentication
      redirect_to signin_path unless signed_in?
    end

    def signed_in?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :signed_in?
end
