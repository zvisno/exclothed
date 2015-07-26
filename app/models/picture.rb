class Picture < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  belongs_to :clothing
end