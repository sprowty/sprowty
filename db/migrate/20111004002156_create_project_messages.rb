class CreateProjectMessages < ActiveRecord::Migration
  def self.up
    create_table :project_messages do |t|
      t.integer :project_id
      t.integer :message_id
      t.timestamps
    end
  end

  def self.down
    drop_table :project_messages
  end
end
