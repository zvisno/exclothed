class Pictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :clothing_id, null: false
      t.string :picture

      t.timestamps null: false
    end
  end
end
