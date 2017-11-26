class UsersController < ApplicationController
  def change_current_city
    session[:current_city_id] = params[:city_id]
    redirect_back fallback_location: root_path
  end
end
