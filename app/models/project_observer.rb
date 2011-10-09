class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
    project.project_alerts.create(:message => transition.to,:occurred => DateTime.now, :alert_type => 'system')
    if transition.to == "posted"
      project.waiting_for_bids
    end
  end
end
