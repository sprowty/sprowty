class CommunityController < ApplicationController
  respond_to :json, :js, :html

  def index
    @community_projects = CommunityProject.paginate(:page => params[:page], :per_page => 5)
    @tags = @community_projects.map(&:tags).uniq
  end

  def show
    @community_project = CommunityProject.find(params[:id])
  end

  def overview
    @community_projects = CommunityProject.paginate(:page => params[:page], :per_page => 5)
  end

end
