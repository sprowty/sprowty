class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
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
    if params[:source_id] && !params[:source_id].blank?
      @source = Project.find(params[:source_id])
      @project.title = @source.title
      @project.description = @source.description
      @project.categories = @source.categories
    end
    #@project.title  = params[:title] unless !params || params[:title].blank?
    @categories = Category.all
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save!
      respond_to do |format|
        format.html {redirect_to @project}
      end
    else
      respond_to do |format|
        render :action => 'new'
      end
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def inside
    @project = Project.find(params[:project_id])
    @project_alerts = @project.project_alerts.paginate(:page => params[:page], :per_page => 5, :order => 'created_at ASC')
  end

  def approve
    @project = Project.find(params[:project_id])
    @project.post
    redirect_to :back
  end

  def cancel
  end
end
