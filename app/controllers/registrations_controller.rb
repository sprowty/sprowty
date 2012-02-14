class RegistrationsController < Devise::RegistrationsController
  def new
    super
    @user.build_profile
  end

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

end
