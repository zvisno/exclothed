class ClothingsController < ApplicationController
  before_filter :require_user

  def new
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      flash[:notice] = "Clothing is created"
      redirect_to home_index_path
    else
      flash.now[:error] = "Something is missing"
      render :action => new_clothing_path
    end
  end

  private

  def clothing_params
    all_params = params[:clothing].merge(owner_id: current_user.id)
    all_params.permit(:color_id, :size_id, :clothing_type_id, :exchange_to_clothing_type_id, :owner_id)
  end
end
