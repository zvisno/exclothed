class CreateClothingBrands < ActiveRecord::Migration
  def change
    create_table :clothing_brands do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
