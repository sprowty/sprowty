class HomeController < ApplicationController
  
  def index
    @search   = Project.search(params[:search])
    @projects = Project.paginate(:page => params[:page], :per_page => 6, :order => 'created_at DESC')
  end
  
end
