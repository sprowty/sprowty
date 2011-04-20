class Profile < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :user_attributes, :first_name, :last_name, :location, :about, :paypal, :facebook, :twitter, :picture
  
  has_attached_file :picture, :styles => { :thumb => '124x124', :profile => "195x175#" }
  
  accepts_nested_attributes_for :user
end
