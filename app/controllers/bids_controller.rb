class BidsController < ApplicationController
  before_filter :require_user
  respond_to :html, :json

  def new
    @project = Project.find(params[:project])
    @bid = Bid.new
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
    @bid.accepted = true
    @bid.save

    @project.user.messages.create :to => @sprowter, :subject => "bid accepted", :body => "your bid has been accepted for project: #{@project.title}."
    redirect_to :back
  end

  def reject
  end

  def counteroffer
  end
end
