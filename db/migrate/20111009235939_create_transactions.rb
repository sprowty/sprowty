class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.references :account
      t.decimal :amount
      t.integer :reference_number
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
