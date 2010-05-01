class AddAmountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :amount, :integer
  end

  def self.down
    remove_column :users, :amount
  end
end
