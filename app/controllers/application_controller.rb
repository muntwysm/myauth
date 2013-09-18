class ApplicationController < ActionController::Base
	protect_from_forgery
  force_ssl


  def require_user
	  unless current_user
	    flash[:notice] = "You must be logged in to access this page"
	    redirect_to login_path
	    return false
	  end
	end

	private

	def current_user
	  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
	end
	helper_method :current_user
	
end
