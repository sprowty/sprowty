class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates_presence_of :why
  validates_presence_of :offer_expires
  
  after_save :update_bids
  
  def update_bids
    self.project.bid_count = self.project.bid_count + 1
    self.project.save
  end
end
