class AddAddressAndTelToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :address, :string
    add_column :users, :tel, :string
  end

  def self.down
    remove_column :users, :tel
    remove_column :users, :address
  end
end
