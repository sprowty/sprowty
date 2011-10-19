class AddTimestampsToProjectAlerts < ActiveRecord::Migration
  def self.up
    add_column :project_alerts, :created_at, :datetime
    add_column :project_alerts, :updated_at, :datetime
  end

  def self.down
  end
end
