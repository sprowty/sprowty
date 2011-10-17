class RefactorMessagesForInbox < ActiveRecord::Migration
  def self.up
    drop_table :messages
    drop_table :user_messages
  end

  def self.down
  end
end
