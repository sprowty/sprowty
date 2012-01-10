class AddZipcodeToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :zipcode, :string
    add_index :profiles, :zipcode
  end

  def self.down
    remove_column :profiles, :zipcode
  end
end
