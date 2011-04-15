class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :user
      t.string :title
      t.text :description
      t.text :tags
      t.float :price
      t.datetime :due_date
      
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
