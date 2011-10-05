class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  has_many :project_messages
  has_many :messages, :through => :project_messages

  validates_presence_of :title, :description, :price, :tags, :city, :state

  state_machine :sm_state, :initial => :unprocessed do
    event :post do
      transition :unprocessed => :pending_approval
    end

    event :approved do
      transition :pending_approval => :posted
    end

    event :reject do
      transition :pending_approval => :rejected
    end

    event :assigned do
      transition :posted => :assigned
    end

    event :work_approved do
      transition :assigned => :completed
    end
  end

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
