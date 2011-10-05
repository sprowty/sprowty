class CreateProjectAlerts < ActiveRecord::Migration
  def self.up
    create_table :project_alerts do |t|
      t.string   :message
      t.datetime :occurred
      t.references :project
    end
  end

  def self.down
    drop_table :project_alerts
  end
end
