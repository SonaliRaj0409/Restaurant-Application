class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :owner
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :restaurants, [:user_id, :created_at]
  end
end
