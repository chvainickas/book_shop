class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pagy::Backend

  helper_method :current_user, :logged_in?, :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: 'You must be logged in to access this page'
    end
  end

  def require_admin
    unless admin?
      redirect_to root_path, alert: 'You must be an admin to access this page'
    end
  end
end
