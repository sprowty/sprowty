class ProjectsController < ApplicationController
  respond_to :html, :js

  def index
   @projects = current_user.projects
   @tags = @projects.map(&:tags).uniq
  end

  def new
    @project        = Project.new
    @project.title  = params[:title] unless !params || params[:title].blank?
    render :layout => 'blank'
  end

  def create
    @project = current_user.projects.new(params[:project])

    if @project.save
      respond_with(@project, :location => root_url)
    else
      render :action => 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

end
