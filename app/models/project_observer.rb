class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
    # dont create an alert on bid_received - it causes problems in the layout and when a bid is really saved its sends a different
    # type of alert anyway
    unless transition.to == "bid_received"
      project.project_alerts.create(:message => transition.to,:occurred => DateTime.now, :alert_type => 'system')
      case transition.to
      when "posted"
        project.waiting_for_bids
      when "assigned"
        project.work_started
      end
    end
  end
end
