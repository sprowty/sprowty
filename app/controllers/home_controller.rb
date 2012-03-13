class HomeController < ApplicationController

  def index

    @search   = Project.where(:sm_state => 'posted').search(params[:search])

    if params[:city] && params[:state]
      @search = Project.where(:sm_state => 'posted', :city => params[:city], :state => params[:state]).search(params[:search])
    end

    if params[:category] && !params[:category].blank?
      @search = Project.where(:sm_state => 'posted', :category => params[:category]).search(params[:search])
    end

    @projects = @search.paginate(:page => params[:page], :per_page => 5, :order => 'created_at desc')
  end
end
