class User < ActiveRecord::Base
  has_one :profile
  has_many :projects
  has_many :skills
  has_many :bids
  has_many :works
  has_one :resume
  has_many :payments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :omniauthable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :terms
  after_create :create_profile

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_acceptance_of :terms

  def create_profile
    self.build_profile.save
  end

  def self.find_by_id_or_username(param)
    where("id = ? or username = ?", param, param).first
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']

    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      user = User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :username => create_username(data['username'], data['first_name'], data['last_name']))
      user.profile.first_name = data['first_name'] unless data['first_name'].blank?
      user.profile.last_name  = data['last_name'] unless data['last_name'].blank?
      user.profile.location   = data['location']['name'] unless data['location'].blank? || data['location']['name'].blank?
      user.profile.username   = data['username'] unless data['username'].blank?
      user.profile.save
      user
    end
  end

  def self.create_username(username = nil, first_name = nil, last_name = nil)
    if !username.blank? || username.taken? != true
      username
    elsif first_name.blank? || last_name.blank?
      "#{first_name.downcase}_#{last_name.downcase}"
    else
      ''
    end
  end

  def self.taken?(username)
    User.find_by_username(username).blank?
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
end
