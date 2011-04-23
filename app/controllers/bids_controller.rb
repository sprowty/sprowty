class BidsController < ApplicationController
  respond_to :html, :json
  
  def new
    @project = Project.find(params[:project])
    render :layout => 'blank'
  end
  
  def create
    @bid = current_user.bids.new(params[:bid])
    
    if @bid.save
      render :json => { :success => true }
    else
      @project = Project.find(params[:bid][:project_id])
      render :json => { :success => 'false', :html => render_to_string(:file => 'bids/new.html.erb', :template => false) }
    end
  end
end
