module ClothingHelper

  def isArticleOfClothesExists id
    Clothing.exists?(id)
  end

end
