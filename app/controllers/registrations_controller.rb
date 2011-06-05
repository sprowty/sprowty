class RegistrationsController < Devise::RegistrationsController

  def create
    if session[:omniauth] == nil
      if verify_recaptcha
        super
        session[:omniauth] = nil unless @user.new_record?
      else
        build_resource
        clean_up_passwords(resource)
        flash[:alert] = 'There was an error with the recaptca code, please try again'
        render_with_scope :new
      end
    else
      super
      session[:omniauth] = nil unless @user.new_record?
    end
  end

end
