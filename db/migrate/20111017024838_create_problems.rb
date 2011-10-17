class CreateProblems < ActiveRecord::Migration
  def self.up
    create_table :problems do |t|
      t.text :detail
      t.references :project
      t.string :name
      t.string :contact
      t.timestamps
    end
  end

  def self.down
    drop_table :problems
  end
end
