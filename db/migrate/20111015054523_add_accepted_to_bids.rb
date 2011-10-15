class AddAcceptedToBids < ActiveRecord::Migration
  def self.up
    add_column :bids, :accepted, :boolean, :default => false
  end

  def self.down
    remove_column :bids, :accepted
  end
end
