class ClothingClothingType < ActiveRecord::Base
  belongs_to :clothing
  belongs_to :clothing_type

  def find_all_exchange_to_items_for id
    ClothingClothingType.where(clothing_id: id).all
  end

  def find_clothing_ids_exchangeable item_ids, clothing_type_id
    ClothingClothingType.where(clothing_id: item_ids).where(clothing_type_id: clothing_type_id)
  end

end
