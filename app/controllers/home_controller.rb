class HomeController < ApplicationController
  
  def index
    @search   = Project.search(params[:search])
    @projects = @search.all
  end
  
end
