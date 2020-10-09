class ApplicationController < ActionController::Base
  before_action :authorized

  helper_method :current_user
  helper_method :logged_in?

  etag { current_user.try :id }

  def authorized
    redirect_to login_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
