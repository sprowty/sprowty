class BidObserver < ActiveRecord::Observer
  observe :bid

  def after_transition(bid, transition)
    bid.project.project_alerts.create(:message => transition.to,:occurred => DateTime.now)
  end
end
