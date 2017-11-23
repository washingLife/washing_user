class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:cel, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.cel || self.email
  end

  def after_sign_in_path_for(resource)
    categories_path
  end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
  def current_city
    unless session[:current_city_id]
      session[:current_city_id] = City.first.id
    end
    
    if session[:current_city_id]
      @current_city ||= City.find(session[:current_city_id])
    else
      @current_city = nil
    end
  end
end
