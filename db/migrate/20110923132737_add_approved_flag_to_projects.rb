class AddApprovedFlagToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :approved, :boolean, :default => false
  end

  def self.down
    remote_column :projects, :approved
  end
end
