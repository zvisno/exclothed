class CreateUserWantedClothes < ActiveRecord::Migration
  def change
    create_table :user_wanted_clothes do |t|
      t.integer :user_id
      t.integer :wanted_clothes_id

      t.timestamps null: false
    end
  end
end
