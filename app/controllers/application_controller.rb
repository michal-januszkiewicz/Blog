class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def require_admin
      unless current_user.try(:admin)
        flash[:danger] = 'Sorry mate, you can\'t do this'
        redirect_to root_url
      end
    end
end
