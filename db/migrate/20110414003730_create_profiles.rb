class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :about
      t.string :paypal
      t.string :facebook
      t.string :twitter
      t.string :username
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
