module HomeHelper
  def expected_clothing_names user_clothing
    clothing_id = user_clothing.id

    matching_clothing_type_ids = user_clothing.exchangeable_clothing_type_ids
    matching_clothing_names = []
    matching_clothing_type_ids.each { |clothing_type|
      name_of_clothing_type = clothing_type.to_i !=0 ?  ClothingType.find(clothing_type.to_i).name : "Any"
      matching_clothing_names.push(name_of_clothing_type)
    }
    matching_clothing_names
  end

  def clothing_name clothing
    ClothingType.find(clothing.clothing_type_id).name
  end

  def clothing_size clothing
    Size.find(clothing.size_id).name
  end

  def clothing_picture clothing
    picture = Picture.where("clothing_id =?", clothing.id)
    picture.empty? ? "no picture" : picture.first.picture
  end
end
