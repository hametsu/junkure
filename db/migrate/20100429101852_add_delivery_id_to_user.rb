class AddDeliveryIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :delivery_id, :integer
  end

  def self.down
    remove_column :users, :delivery_id
  end
end
