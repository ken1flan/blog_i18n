class ApplicationController < ActionController::Base
  include LocaleSwitchable

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if !!session[:user_id]
  end

  def login?
    !!current_user
  end

  def require_login
    redirect_to new_session_path unless login?
  end
end
