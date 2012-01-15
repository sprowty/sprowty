class AddZipCodeToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, "zipcode", :string

    add_index :projects, :zipcode
  end

  def self.down
    remove_column :projects, :zipcode
  end
end
