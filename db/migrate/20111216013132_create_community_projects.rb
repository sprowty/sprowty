class CreateCommunityProjects < ActiveRecord::Migration
  def self.up
    create_table :community_projects do |t|
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
    drop_table :community_projects
  end
end
