class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bids
  
  validates_presence_of :title, :description, :price, :tags, :city, :state
end
