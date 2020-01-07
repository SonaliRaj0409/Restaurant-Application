class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.decimal :price
      t.string :picture
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :menus, [:restaurant_id, :created_at]
  end
end
