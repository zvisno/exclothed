class User < ActiveRecord::Base
  has_many :clothing, foreign_key: "owner_id"
  has_many :user_wanted_clothes, class_name: "UserWantedClothes"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
