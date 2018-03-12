class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  protected

   def authenticate_user
     redirect_to login_path  unless current_user.present?
   end

   def current_user
     @current_user ||= User.find_by_email(session[:user_id])
   end

end
