class ClothingClothingType < ActiveRecord::Base
  belongs_to :clothing
  belongs_to :clothing_type

  def self.find_all_exchange_to_items_for id
    where(clothing_id: id).all
  end

  def self.find_clothing_ids_exchangeable item_ids, clothing_type_id
    where(clothing_id: item_ids).where(clothing_type_id: clothing_type_id)
  end

end
