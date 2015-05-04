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
      all = []
      errors = @clothing.errors.messages
      errors.each { |key, value|
        all.push "#{key} : #{value[0]}"
      }

      flash.now[:notice] = all

      render action: "new"
    end
  end

  private

  def clothing_params
    all_params = params[:clothing].merge(owner_id: current_user.id)

    all_params.permit(:color_id, :size_id, :clothing_type_id, :owner_id, :exchangeable_clothing_type_ids => [])
  end
end
