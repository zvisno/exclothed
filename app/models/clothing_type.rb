class ClothingType < ActiveRecord::Base
  def get_clothing_type type
    ClothingType.find_by name: type
  end

  def create_clothing_type type
    ClothingType.create name: type
  end
end
