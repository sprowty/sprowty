class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.references :user
      t.references :project
      t.float :price
      t.text :why
      t.datetime :offer_expires
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
