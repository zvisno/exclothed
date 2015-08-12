class Clothing < ActiveRecord::Base
  belongs_to :user
  belongs_to :clothing_type
  belongs_to :size
  belongs_to :color
  belongs_to :clothing_brand
  has_many :clothing_clothing_types
  has_many :pictures
  has_many :clothing_wanted_clothings
  accepts_nested_attributes_for :pictures

  has_many :exchangeable_clothing_types, through: :clothing_clothing_types, source: :clothing_type

  validates :clothing_type_id, presence: true
  validates :size_id, presence: true
  validates :color_id, presence: true
  validates :owner_id, presence: true

  validates_associated :pictures
  validates :pictures, presence: true

  def self.get_user_items uid
    where(owner_id: uid.to_i).order(created_at: :desc).all
  end

  def get_all_items_of_types clothing_type_ids, uid
    Clothing.where.not(owner_id: uid).where(clothing_type_id: clothing_type_ids)
  end

  def matching_clothings
    clothings = Clothing.
        joins("LEFT JOIN clothing_clothing_types ON clothing_clothing_types.clothing_id = clothings.id").
        where("clothing_clothing_types.id IS NULL OR clothing_clothing_types.clothing_type_id = ?", clothing_type_id).
        where.not(owner_id: owner_id)

    if exchangeable_clothing_type_ids.any?
      clothings.where(clothing_type_id: exchangeable_clothing_type_ids)
    else
      clothings
    end
  end
end
