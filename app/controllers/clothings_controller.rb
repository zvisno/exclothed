class ClothingsController < ApplicationController
  before_filter :require_user

  include ClothingHelper

  def show
    render Clothing.find params[:id]
  end

  def new
    @clothing = Clothing.new
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

end
