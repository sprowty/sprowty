class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def authenticate_admin!
    if current_user && current_user.is_admin?
      true
    else
      false
    end
  end
end
