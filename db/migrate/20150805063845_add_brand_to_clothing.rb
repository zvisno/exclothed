class AddBrandToClothing < ActiveRecord::Migration
  def change
    add_column :clothings, :clothing_brand_id, :integer
  end
end
