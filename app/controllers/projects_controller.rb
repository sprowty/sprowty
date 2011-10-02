class ProjectsController < ApplicationController
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
<<<<<<< HEAD
    render :layout => 'blank'
    @categories = Category.find(:all)
=======
>>>>>>> b329b8243d12762bf0dcecddbce82de462dbcb54
  end

  def create
    @project = current_user.projects.new(params[:project])
    @category = Category.find(params[:id])  
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
