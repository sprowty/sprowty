class ProjectObserver < ActiveRecord::Observer
  observe :project

  def after_transition(project, transition)
    debugger
    puts "project observer hit"
  end
end
