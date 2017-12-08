class UsersController < ApplicationController
  def change_current_city
    session[:current_city_id] = params[:city_id]
    redirect_to :back
  end
end
