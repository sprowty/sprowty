class MoveMessagesOffProject < ActiveRecord::Migration
  def self.up
    drop_table :project_messages
  end

  def self.down
    create_table :project_messages do |t|
      t.integer :project_id
      t.integer :message_id
      t.timestamps
    end
  end
end
