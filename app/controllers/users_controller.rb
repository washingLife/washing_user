class UsersController < ApplicationController
  def user_card_logs
    @user_card_logs = current_user.user_card.user_card_logs.paginate(page: params[:page], per_page: 10).order(id: :desc)
  end

  def coupons
    @coupons = current_user.coupons.where('used_at is null').paginate(page: params[:page], per_page: 10).order(valid_to: :desc)
  end

  def change_current_city
    session[:current_city_id] = params[:city_id]
    redirect_to :back
  end
end