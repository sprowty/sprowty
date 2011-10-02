class CorrectStateMachineFields < ActiveRecord::Migration
  def self.up
    remove_column :works, :state
    remove_column :bids, :state
    add_column :projects, :sm_state, :string
    add_column :works, :sm_state, :string
    add_column :bids, :sm_state, :string

    add_index :projects, :sm_state
    add_index :works, :sm_state
    add_index :bids, :sm_state
  end

  def self.down
    add_column :works, :state, :string
    add_column :bids, :state, :string
    remove_column :projects, :sm_state
    remove_column :works, :sm_state
    remove_column :bids, :sm_state
  end
end
