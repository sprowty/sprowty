class HomeController < ApplicationController

  def index
    @search   = Project.search(params[:search])
    @projects = Project.paginate(:page => params[:page], :per_page => 5, :order => 'created_at DESC')
    @tags = @projects.map(&:tags).uniq
  end
end
