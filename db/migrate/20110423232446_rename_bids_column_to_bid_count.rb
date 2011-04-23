class RenameBidsColumnToBidCount < ActiveRecord::Migration
  def self.up
    rename_column :projects, :bids, :bid_count
  end

  def self.down
    rename_column :projects, :bid_count, :bids
  end
end