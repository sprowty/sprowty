class AddLocationFieldsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :city, :string
    add_column :projects, :state, :string
  end

  def self.down
    remove_column :projects, :state
    remove_column :projects, :city
  end
end
