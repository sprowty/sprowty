class ProjectObserver < ActiveRecord::Observer
  observe :project

#  def after_transition(project, transition)
#    after_transition do |project, transition|
#      project.project_alerts.create(:message => transition.to,:occurred => DateTime.now)
#    end
#  end
end
