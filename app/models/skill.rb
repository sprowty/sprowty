class Skill < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :skill

end
