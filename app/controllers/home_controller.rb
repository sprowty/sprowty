class HomeController < ApplicationController

  def index
    if params[:city] && params[:state]
      @projects = Project.where(:city => params[:city], :state => params[:state])
    end

    if params[:category] && !params[:category].blank?
       @projects = Project.where(:category => params[:category])
    end

    @search   = Project.where(:sm_state => 'posted').search(params[:search])
    @projects = @search.paginate(:page => params[:page], :per_page => 5, :order => 'created_at desc')
  end
end
