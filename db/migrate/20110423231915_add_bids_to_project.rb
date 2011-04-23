class AddBidsToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :bids, :integer, :default => 0
  end

  def self.down
    remove_column :projects, :bids
  end
end