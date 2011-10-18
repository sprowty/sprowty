class AddStatusToProblems < ActiveRecord::Migration
  def self.up
    add_column :problems, :status, :string, :default => 'open'
  end

  def self.down
    remove_column :problems, :status
  end
end
