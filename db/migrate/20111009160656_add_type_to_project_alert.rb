class AddTypeToProjectAlert < ActiveRecord::Migration
  def self.up
    add_column :project_alerts, :alert_type, :string
  end

  def self.down
    remove_column :project_alerts, :alert_type
  end
end
