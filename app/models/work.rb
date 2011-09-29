class Work < ActiveRecord::Base
  belongs_to :user

  has_attached_file :work, :styles => { :thumb => '100x100' }
  validates_presence_of :work

#  state_machine :initial => :parked do
#    before_transition :parked => any - :parked, :do => :put_on_seatbelt
#  end

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
