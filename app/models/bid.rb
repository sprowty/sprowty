class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :why
  validates_presence_of :offer_expires

  after_save :update_bids

  state_machine :sm_state, :initial => :unprocessed do
    event :submit do
      transition :unprocessed => :pending_approval
    end

    event :cancel do
      transition :pending_approval => :cancelled
    end

    event :accepted do
      transition :pending_approval => :accepted
    end

    event :reject do
      transition :pending_approval => :rejected
    end

    event :counter_offer do
      transition :rejected => :pending_approval
    end
  end


  def update_bids
    self.project.bid_count = self.project.bid_count + 1
    self.project.save
  end
end
