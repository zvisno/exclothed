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

  accepts_nested_attributes_for :clothing_clothing_types, :reject_if => :all_blank

  def get_user_items uid
    Clothing.where(owner_id: uid.to_i).all
  end
end
