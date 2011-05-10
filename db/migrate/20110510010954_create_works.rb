class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.references :user
      t.string :work_file_name
      t.string :work_content_type
      t.integer :work_file_size
      t.datetime :work_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end