class Message < ActiveRecord::Base
  has_many :project_messages
  has_many :projects, :through => :project_messages

  has_many :user_messages
  has_many :users, :through => :user_messages
end
