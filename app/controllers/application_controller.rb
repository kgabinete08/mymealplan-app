class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Please log in first."
      redirect_to root_path
    end
  end

  # Below code can be used for 'admin' only actions

  # def require_admin
  #   if !logged_in? && !current_user.admin?
  #     flash[:error] = "You do not have the permission to do that."
  #     redirect_to root_path
  #   end
  # end
end
