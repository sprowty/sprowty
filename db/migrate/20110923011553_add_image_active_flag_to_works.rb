class AddImageActiveFlagToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :image_approved, :boolean, :default => false
  end

  def self.down
    remove_column :works, :image_approved
  end
end
