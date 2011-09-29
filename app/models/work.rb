class Work < ActiveRecord::Base
  belongs_to :user

  has_attached_file :work, :styles => { :thumb => '100x100' }
  validates_presence_of :work

  state_machine :initial => :unprocessed do
    event :post do
      transition :unprocessed => :pending_approval
    end

    event :approved do
      transition :pending_approval => :approved
    end

    event :reject do
      transition :pending_approval => :rejected
    end
  end

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
