class CreateUserMessages < ActiveRecord::Migration
  def self.up
    create_table :user_messages do |t|
      t.integer :user_id
      t.integer :message_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_messages
  end
end
