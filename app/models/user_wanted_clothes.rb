class UserWantedClothes < ActiveRecord::Base
  belongs_to :user

  def self.users_who_liked clothes_id
    where(wanted_clothes_id: clothes_id)
  end

  def self.clothes_who_liked_by user_id
    where(user_is: user_id)
  end
end
