class UpdateTransactionWithPaypalDetails < ActiveRecord::Migration
  def self.up
    add_column :transactions, :paypal_transaction_id, :integer, :null => false

    add_index :transactions, :paypal_transaction_id
  end

  def self.down
    remove_column :transactions, :paypal_transaction_id
  end
end
