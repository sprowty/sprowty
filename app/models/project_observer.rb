class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
    project.project_alerts.create(:message => transition.to,:occurred => DateTime.now)
    if transition.to == "posted"
      project.project_alerts.create(:message => "waiting for bids", :occurred => DateTime.now)
    end
  end
end
