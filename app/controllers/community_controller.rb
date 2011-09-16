class CommunityController < ApplicationController
  respond_to :json, :js, :html

  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 6)
  end

  def show
    @project = Project.find(params[:id])
  end

end
