class CreateClothingsClothingTypes < ActiveRecord::Migration
  def change
    create_table :clothing_clothing_types do |t|
      t.integer :clothing_id, null: false
      t.integer :clothing_type_id

      t.timestamps null: false
    end
  end
end
