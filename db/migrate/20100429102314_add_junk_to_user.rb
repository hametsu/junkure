class AddJunkToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :junk, :text
  end

  def self.down
    remove_column :users, :junk
  end
end
