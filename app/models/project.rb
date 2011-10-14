class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_many :project_alerts
  has_many :categories

  has_one :assignment
  has_one :user, :through => :assignment

  validates_presence_of :title, :description, :price, :tags, :city, :state

  state_machine :sm_state, :initial => :pending_post do
    event :post do transition :pending_post => :posted end
    event :waiting_for_bids do transition :posted => :waiting_for_bids end
    event :post_bid do transition :waiting_for_bids => :bid_received end
    event :accept_bid do transition :bid_received => :assigned end
    event :submit_payment do transition :assigned => :funded end
    event :work_started do transition :funded => :work_in_progress end
    event :work_completed do transition :work_in_progress => :work_completed end
    event :post_issue do transition :work_completed => :work_in_progress end
  end

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
