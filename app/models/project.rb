class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates_presence_of :title, :description, :price, :tags, :city, :state

  def to_param
    "#{id}-#{title}".downcase.gsub(/\s+/, '-').gsub(/[^\w\-]/, '')
  end
end
