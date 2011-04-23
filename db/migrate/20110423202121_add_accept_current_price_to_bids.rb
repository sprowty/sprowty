class AddAcceptCurrentPriceToBids < ActiveRecord::Migration
  def self.up
    add_column :bids, :accept_current_price, :boolean
  end

  def self.down
    remove_column :bids, :accept_current_price
  end
end