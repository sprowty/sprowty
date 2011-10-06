class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates_presence_of :why
  validates_presence_of :offer_expires

  state_machine :sm_state, :initial => :submitted do
    event :approve do transition :submitted => :approved end
    event :reject do transition :submitted => :rejected end
  end
end
