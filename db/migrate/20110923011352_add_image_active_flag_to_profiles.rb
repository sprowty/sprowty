class AddImageActiveFlagToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :image_approved, :boolean, :default => false
  end

  def self.down
    remove_column :profiles, :image_approved
  end
end
