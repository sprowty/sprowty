class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates_presence_of :why
  validates_presence_of :offer_expires
  
end
