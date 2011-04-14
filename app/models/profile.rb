class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :picture, :styles => { :thumb => '100x100', :profile => "195x175>" }
  
  accepts_nested_attributes_for :user
end
