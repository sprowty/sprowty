class BidsController < ApplicationController
  before_filter :require_user
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

  def dashboard
    @project  = Project.find(params[:project])
    @bids     = Bid.where(:project_id => @project.id)
  end

  def accept
    @bid = Bid.find(params[:bid_id])
    @project = @bid.project
    @sprowter = @bid.user
    @project.accept_bid
    @project.work_started
    @project.create_assignment :user_id => @sprowter.id # this creates a hard link to who is working on this project
    redirect_to :back
  end

  def reject
  end

  def counteroffer
  end
end
