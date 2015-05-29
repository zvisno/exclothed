class ClothingClothingTypesController < ApplicationController
  respond_to :html, :js

  def edit
    exchangeables = ClothingClothingType.new
    clothing_all_exchangeable = exchangeables.find_all_exchange_to_items_for params[:clothing_id]

    current_item = Clothing.find(params[:clothing_id])

    exchangeable_clothing_types = []

    clothing_all_exchangeable.each { |item|
      exchangeable_clothing_types.push item.clothing_type_id
    }

    clothing = Clothing.new

    all_exch_items = clothing.get_all_items_of_types(exchangeable_clothing_types, current_user.id)

    all_exch_items_ids = []
    all_exch_items.each { |item|
      all_exch_items_ids.push item.id
    }

    @matching_items = exchangeables.find_clothing_ids_exchangeable all_exch_items_ids, current_item.clothing_type_id
  end
end