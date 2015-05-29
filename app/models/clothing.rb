class Clothing < ActiveRecord::Base
  belongs_to :user
  belongs_to :clothing_type
  belongs_to :size
  belongs_to :color
  has_many :clothing_clothing_types
  has_many :exchangeable_clothing_types, through: :clothing_clothing_types, source: :clothing_type

  validates :clothing_type_id, presence: true
  validates :size_id, presence: true
  validates :color_id, presence: true
  validates :owner_id, presence: true

  def get_user_items uid
    Clothing.where(owner_id: uid.to_i).order(created_at: :desc).all
  end

  def get_all_items_of_types clothing_type_ids, uid
    Clothing.where.not(owner_id: uid).where(clothing_type_id: clothing_type_ids)
  end
end
