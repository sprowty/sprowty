class DropAssignments < ActiveRecord::Migration
  def self.up
    drop_table :assignments
  end

  def self.down
    create_table :assignments do |t|
      t.references :user
      t.references :project
    end
  end
end
