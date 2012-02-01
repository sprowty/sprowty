class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  respond_to :html, :js

  def index
   @projects = current_user.projects.paginate(:page => params[:page], :per_page => 10)

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
      @project.category = @source.category
    end
    if params[:title] && !params[:title].blank?
      @project.title  = params[:title]
    end
    @categories = Category.all
  end

  def create
    if params[:project][:price].scan("$").length > 0
      params[:project][:price].delete!('$')
    end

    @project = current_user.projects.build(params[:project])

    if params[:zipcode] && !params[:zipcode].blank?
      zipcode = ZipCode.where(:zipcode => params[:zipcode]).first
      debugger
      params[:project][:city] = zipcode.city
      params[:project][:state] = zipcode.state
    end

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
