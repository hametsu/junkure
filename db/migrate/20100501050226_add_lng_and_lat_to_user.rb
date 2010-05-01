class AddLngAndLatToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :lng, :float
    add_column :users, :lat, :float
  end

  def self.down
    remove_column :users, :lat
    remove_column :users, :lng
  end
end
