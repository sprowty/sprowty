class CommunityController < ApplicationController
  respond_to :json, :js, :html

  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 5)
    @tags = @projects.map(&:tags).uniq
  end

  def show
    @project = Project.find(params[:id])
  end

  def overview
    @projects = Project.paginate(:page => params[:page], :per_page => 5)
  end

end
