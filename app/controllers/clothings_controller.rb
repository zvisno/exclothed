class ClothingsController < ApplicationController
  respond_to :html, :js
  before_filter :require_user

  include ClothingHelper

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
      redirect_to home_path
    else
      all = []
      errors = @clothing.errors.messages
      errors.each { |key, value|
        all.push "#{key} : #{value[0]}"
      }
      flash.now[:notice] = all
      render action: "new"
    end
  end

  def destroy
    Clothing.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to home_path
  end

  def user_added_clothing_params
    all_params = params[:clothing].merge(owner_id: current_user.id)
    all_params.permit(:color_id, :size_id, :clothing_type_id, :owner_id, exchangeable_clothing_type_ids: [], pictures_attributes: [:picture])
  end
end
