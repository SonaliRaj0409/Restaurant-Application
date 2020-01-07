class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
# Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless !current_user?(@user) && current_user.admin?
    end
end
