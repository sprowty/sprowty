class Account < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.references :user
      t.decimal :balance
      t.decimal :available_funds
      t.decimal :withdrawn_funds
      t.decimal :funds_awaiting_clearance
      t.decimal :revenue_purchases
      t.decimal :incoming_payments
      t.decimal :money_spent
    end
  end

  def self.down
    drop_table :accounts
  end
end
