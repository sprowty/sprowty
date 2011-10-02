class WorkObserver < ActiveRecord::Observer
  observe :work

  def after_transition(work, transition)
  end

end
