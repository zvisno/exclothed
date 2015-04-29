class CreateClothings < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.integer  :clothing_type_id, null: false
      t.integer  :size_id, null: false
      t.integer  :color_id, null: false
      t.integer  :exchange_to_clothing_type_id
      t.integer  :owner_id, null: false

      t.timestamps null: false
    end
  end
end
