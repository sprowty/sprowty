class ProjectsController < ApplicationController
  before_filter :require_user

  respond_to :html, :js

  def index
   @projects = current_user.projects

   if params[:filter]
     @filter = params[:filter]
     case @filter
       when @filter == 'open' then @projects.where(:state => 'open')
       when @filter == 'completed' then @projects.where(:state => 'completed')
     end
   end

   @tags = @projects.map(&:tags).uniq
  end

  def new
    @project        = Project.new
    @project.title  = params[:title] unless !params || params[:title].blank?
    @categories = Category.all
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

  def inside
    @project = Project.find(params[:project_id])
    @project_alerts = @project.project_alerts.paginate(:page => params[:page], :per_page => 6, :order => 'created_at ASC')
  end

  def approve
    @project = Project.find(params[:project_id])
    @project.post
    redirect_to :back
  end
end
