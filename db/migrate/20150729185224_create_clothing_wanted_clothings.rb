class CreateClothingWantedClothings < ActiveRecord::Migration
  def change
    create_table :clothing_wanted_clothings do |t|
      t.integer :clothing_id, null: false
      t.integer :wanted_clothing_id, null: false

      t.timestamps null: false
    end
    add_index :clothing_wanted_clothings,
              [:clothing_id, :wanted_clothing_id],
              unique: true,
              name: "index_clo_wanted_clo_on_clo_id_and_wanted_clo_id"
  end
end
