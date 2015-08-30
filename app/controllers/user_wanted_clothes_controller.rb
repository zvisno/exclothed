class UserWantedClothesController < ApplicationController
  respond_to :html, :js

  def create
    current_user.user_wanted_clothes.find_or_create_by(wanted_clothes_id: params[:wanted_clothes_id])

    render nothing: true
  end

  def destroy
    current_user.user_wanted_clothes.where(wanted_clothes_id: params[:wanted_clothes_id]).destroy_all

    render nothing: true
  end

  def show
    if current_user.user_wanted_clothes.exists?(wanted_clothes_id: params[:id])
      render :json => {wanted: true}
    else
      render :json => {wanted: false}
    end
  end

end