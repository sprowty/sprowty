class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    remove_column :profiles, :username
  end

  def self.down
    add_column :profiles, :username, :string
    remove_column :users, :username
  end
end
