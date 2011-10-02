class BidObserver < ActiveRecord::Observer
  observe :bid

  def after_transition(bid, transition)
  end
end
