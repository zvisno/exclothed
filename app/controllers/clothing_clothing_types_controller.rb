class ClothingClothingTypesController < ApplicationController
  respond_to :html, :js

  def index
    clothing = Clothing.find(params[:clothing_id])
    @matching_clothes = clothing.matching_clothes
  end
end