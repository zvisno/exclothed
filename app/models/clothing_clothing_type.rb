class ClothingClothingType < ActiveRecord::Base
  belongs_to :clothing
  belongs_to :clothing_type

  def find_all_exchange_to_items_for id
    ClothingClothingType.where(clothing_id: id.to_i).all
  end

end
