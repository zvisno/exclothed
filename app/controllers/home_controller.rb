class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user_items = {}
    @clothings = Clothing.new
    items = @clothings.get_user_items current_user.id

    items.each { |item|
      id = item.id
      prop = []

      name = ClothingType.find(item.clothing_type_id.to_i).name
      size = Size.find(item.size_id.to_i).name

      all_exchange_to_items = item.exchangeable_clothing_type_ids


      exchangeable_clothing = []
      all_exchange_to_items.each { |type|
        current_type = type.to_i !=0 ?  ClothingType.find(type.to_i).name : "Any"
        exchangeable_clothing.push(current_type)
      }

      prop.push(name, size, exchangeable_clothing)
      @user_items[id] = prop
    }
  end
  
  def new
    
  end

  def show

  end
end
