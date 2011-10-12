class AddBidIdToProjectAlerts < ActiveRecord::Migration
  def self.up
    add_column :project_alerts, :bid_id, :integer
  end

  def self.down
    remove_column :project_alerts, :bid_id
  end
end
