module UserWantedClothingHelper
  def clothes_likes clothes
    UserWantedClothes.users_who_liked(clothes.id).length
  end
end