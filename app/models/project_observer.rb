class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
  end
end
