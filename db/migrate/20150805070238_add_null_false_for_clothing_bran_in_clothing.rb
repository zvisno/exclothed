class AddNullFalseForClothingBranInClothing < ActiveRecord::Migration
  def change
    change_column :clothings, :clothing_brand_id, :integer, null: false
  end
end
