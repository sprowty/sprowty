class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :works,    :through  => :user
  has_many :skills,   :through  => :user
  has_many :projects, :through  => :user

  attr_accessible :user_attributes, :first_name, :last_name, :location, :about, :paypal, :facebook, :twitter, :picture, :zipcode

  has_attached_file :picture,
    :default_url => '/images/default-avatar.png',
    :styles => { :thumb => '124x124', :profile => "195x175#" }

  # FIXME this is causing problems on when seeding db
  #before_update :remove_emails

  def self.find_by_id_or_username(param)
    where("username = ? or id = ?", param, param).first
  end

  def full_name
    if first_name.blank? && last_name.blank?
      "Author"
    else
      "#{first_name} #{last_name}"
    end
  end

  private

  # FIXME
  def remove_emails
    self.about = self.about.gsub(/[^@\s]*@[^@\s]*\.[^@\s]*/, '')
  end
end
