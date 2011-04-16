class ProjectsController < ApplicationController
  respond_to :html, :json
  
  def index
    @projects = current_user.projects
  end
  
  def new
    @project = Project.new
    render :layout => 'blank'
  end
  
  def create
    @project = current_user.projects.new(params[:project])
    
    if @project.save
      render :json => { :success => true }
    else
      render :json => { :success => 'false', :html => render_to_string(:file => 'projects/new.html.erb', :template => false) }
    end
  end
  
  
end
