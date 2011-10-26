class SimplfyTransactionPayments < ActiveRecord::Migration
  def self.up
    drop_table :payments
    add_column :transactions, :sm_state, :string
    add_column :transactions, :tx_type, :string
    change_column :transactions, :amount, :float
    remove_column :transactions, :reference_number
  end

  def self.down
  end
end
