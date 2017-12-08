class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
