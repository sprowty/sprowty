class Transaction < ActiveRecord::Base
  belongs_to :account

  state_machine :sm_state, :initial => :unprocessed do
    event :pay do
      transition :unprocessed => :pending
    end

    event :confirmed do #after paypal callback notification
      transition :pending => :processed
    end
  end

end

