class CommunityController < ApplicationController
  respond_to :json, :js, :html

  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @project = Project.find(params[:id])
  end

  def overview
    @projects = Project.paginate(:page => params[:page], :per_page => 9)
  end

end
