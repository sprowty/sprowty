class CreateFeedback < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :project_id
      t.references :user
      t.text :feedback
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
