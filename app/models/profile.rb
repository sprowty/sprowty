class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :works,    :through  => :user
  has_many :skills,   :through  => :user
  has_many :projects, :through  => :user

  attr_accessible :user_attributes, :first_name, :last_name, :location, :about, :paypal, :facebook, :twitter, :picture
  
  has_attached_file :picture, :styles => { :thumb => '124x124', :profile => "195x175#" }
  
  accepts_nested_attributes_for :user

  def self.find_by_id_or_username(param)
    where("username = ? or id = ?", param, param).first
  end
end
