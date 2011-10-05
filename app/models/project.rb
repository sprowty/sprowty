class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  has_many :project_alerts

  validates_presence_of :title, :description, :price, :tags, :city, :state

  state_machine :sm_state, :initial => :pending_post do
    event :post do
      transition :pending_post => :posted
      # waiting for bids
    end

    event :accept_bid do
      transition :posted => :assigned
    end

    event :submit_payment do
      transition :assigned => :funded
    end

    event :work_started do
      transition :funded => :work_in_progress
    end

    event :work_completed do
      transition :work_in_progress => :work_completed
    end

    event :post_issue do
      transition :work_completed => :work_in_progress
    end

    after_transition do |project, transition|
      project.project_alerts.create(:message => transition.to,:occurred => DateTime.now)
      puts "@@@@@@@@@@@@@@@@@@ project: #{project} transition: #{transition.to}"
    end
  end

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
