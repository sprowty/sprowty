class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_user
    current_user || current_admin_user
  end
end
