class AddStateMachineFields < ActiveRecord::Migration
  def self.up
    add_column :works, :state, :string
    add_column :bids, :state, :string

    add_index :works, :state
    add_index :bids, :state
  end

  def self.down
    remove_column :works, :state
    remove_column :bids, :state
  end
end
