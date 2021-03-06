class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_many :projects, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  has_many :bids, :dependent => :destroy
  has_many :works, :dependent => :destroy
  has_one :resume, :dependent => :destroy
  has_one :account, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy

  has_many :messages,
              :as => :sender,
              :class_name => 'Message',
              :conditions => {:hidden_at => nil},
              :order => 'messages.created_at DESC'
  has_many :received_messages,
              :as => :receiver,
              :class_name => 'MessageRecipient',
              :include => :message,
              :conditions => ['message_recipients.hidden_at IS NULL AND messages.state = ?', 'sent'],
              :order => 'messages.created_at DESC'


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :omniauthable, :trackable, :validatable

  accepts_nested_attributes_for :profile, :allow_destroy => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :terms, :profile_attributes, :is_admin, :zipcode

  after_create :setup_account

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_acceptance_of :terms
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  def self.find_by_id_or_email(param)
    where("id = ? or email = ?", param, param).first
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
      user.username   = data['username'] unless data['username'].blank?
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

  def latest_seeds
    projects
  end

  def latest_sprowts
    projects = Array.new
    bids.map(&:project).each do |bid|
      if bid.project.sm_state == "work_completed"
        projects << bid.project
      end
    end
    projects.flatten
  end

  def current_sprowts
    projects = Array.new
    bids.map(&:project).each do |bid|
      if bid.project.sm_state != "work_completed"
        projects << bid.project
      end
    end
  end

  private

  def create_profile
    self.build_profile.save
  end

  def setup_account
    create_account
  end

end
