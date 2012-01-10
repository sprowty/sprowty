class CreateZipCodes < ActiveRecord::Migration
  def self.up
    create_table :zip_codes do |t|
      t.integer :zipcode, :null => false
      t.string :city
      t.string :state
      t.float  :lat
      t.float  :lng
    end

    add_index :zip_codes, :zipcode, :unique => true
  end

  def self.down
    drop_table :zip_codes
  end
end
