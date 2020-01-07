class AddAdminToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :admin, :boolean, default: false
  end
end
