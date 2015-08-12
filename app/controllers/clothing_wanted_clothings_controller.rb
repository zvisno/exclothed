class ClothingWantedClothingsController < ApplicationController
  respond_to :html, :js
  def create
    clothing = current_user.clothing.find(params[:clothing_id])
    clothing.clothing_wanted_clothings.find_or_create_by(wanted_clothing_id: params[:wanted_clothing_id])

    render nothing: true
  end

  def show
    clothing = current_user.clothing.find(params[:clothing_id])

    result = clothing.clothing_wanted_clothings.find_by(wanted_clothing_id: params[:wanted_clothing_id])
     if result.nil?
       render :json => {result: false}
     else
       is_match = ClothingWantedClothing.
           where(clothing_id: params[:wanted_clothing_id], wanted_clothing_id: params[:clothing_id])
        if is_match.exists?
          render :json => {result: true, match: true}
        else
          render :json => {result: true, match: false}
        end
     end
  end

  def destroy
    clothing = current_user.clothing.find(params[:clothing_id])
    clothing.clothing_wanted_clothings.where(wanted_clothing_id: params[:wanted_clothing_id]).destroy_all
    render nothing: true
  end
end