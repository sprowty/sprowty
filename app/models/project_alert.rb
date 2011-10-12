class ProjectAlert < ActiveRecord::Base
  belongs_to :project
  belongs_to :bid
end
