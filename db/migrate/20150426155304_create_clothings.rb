class CreateClothings < ActiveRecord::Migration
  def change
    create_table :clothings do |t|
      t.integer  :clothing_type_id , null: false
      t.string   :size
      t.string   :color
      t.string   :exchange_to
      t.string   :owner

      t.timestamps null: false
    end
  end
end
