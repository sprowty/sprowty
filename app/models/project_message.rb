class ProjectMessage < ActiveRecord::Base
  belongs_to :project
  belongs_to :message
end
