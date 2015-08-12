class ClothingBrand < ActiveRecord::Base
  def get_clothing_brand type
    ClothingBrand.find_by name: type
  end

  def create_clothing_brand type
    ClothingBrand.create name: type
  end
end
