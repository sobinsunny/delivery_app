class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  protected

  def authenticate_user
    redirect_to login_path unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
