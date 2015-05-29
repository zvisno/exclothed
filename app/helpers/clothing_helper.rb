module ClothingHelper
  def user_added_clothing_params
    all_params = params[:clothing].merge(owner_id: current_user.id)
    all_params.permit(:color_id, :size_id, :clothing_type_id, :owner_id, :exchangeable_clothing_type_ids => [])
  end
end
