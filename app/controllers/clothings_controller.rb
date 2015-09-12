class ClothingsController < ApplicationController
  respond_to :html, :js
  before_filter :require_user

  include ClothingHelper
  include UserWantedClothingHelper

  def index
    @user_clothes = Clothing.get_user_items(current_user.id)
  end

  def show
    render Clothing.find params[:id]
  end

  def new
    @clothing = Clothing.new
    @clothing.pictures.build
  end

  def create
    @clothing = Clothing.new(user_added_clothing_params)

    if @clothing.save
      flash[:notice] = "Clothing is created"
      redirect_to clothings_path
    else
      all = []
      errors = @clothing.errors.full_messages.to_sentence
      flash.now[:notice] = errors
      render action: "new"
    end
  end

  def destroy
    # TBD. Handle exception here when user wants to delete someone else's clothes
    item_of_clothes = current_user.clothing.find(params[:id])

    if item_of_clothes.nil?
      flash[:notice] = "Hey! What are you doing?"
    else
      item_of_clothes.pictures.destroy
      item_of_clothes.destroy
      flash[:success] = "User is deleted"
    end

    redirect_to clothings_path
  end

  def user_added_clothing_params
    all_params = params[:clothing].merge(owner_id: current_user.id)
    all_params.permit(:color_id, :size_id, :clothing_type_id, :owner_id, :clothing_brand_id, exchangeable_clothing_type_ids: [], pictures_attributes: [:picture, :picture_cache])
  end
end
