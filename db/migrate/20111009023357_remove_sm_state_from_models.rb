class RemoveSmStateFromModels < ActiveRecord::Migration
  def self.up
    remove_column :works, :sm_state
    remove_column :bids, :sm_state
  end

  def self.down
    add_column :works, :sm_state, :string
    add_column :bids, :sm_state, :string
  end
end
