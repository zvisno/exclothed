class ClothingsController < ApplicationController
  def new
    @clothing = Clothing.new
  end
end
