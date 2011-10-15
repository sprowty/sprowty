class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
    project.project_alerts.create(:message => transition.to,:occurred => DateTime.now, :alert_type => 'system')
    case transition.to
    when "posted"
      project.waiting_for_bids
    when "assigned"
      project.work_started
    end
  end
end
