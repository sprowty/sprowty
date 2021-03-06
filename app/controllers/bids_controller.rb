class BidsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def new
    @project = Project.find(params[:project_id])
    @bid = Bid.new
    render :layout => false
  end

  def show
  end

  def create
    @bid = current_user.bids.new(params[:bid])
    @bid.why = params[:why]
    @bid.price = params[:price]
    @bid.project_id = params[:project_id]
    @bid.offer_expires=1.week

    if @bid.save
      flash[:notice] = "Bid created"
      redirect_to project_url(@bid.project)
    else
      flash[:error] = "Error creating bid."
      @project = Project.find(params[:project_id])
      redirect_to project_url(@bid.project)
    end
  end

  def dashboard
    @project  = Project.find(params[:project_id])
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
    @bid = Bid.find(params[:bid_id])
    @project = @bid.project
    @sprowter = @bid.user
    @project.reject_bid
    @bid.accepted=false
    @bid.save
    @project.user.messages.create :to => @sprowter, :subject => "bid rejected", :body => "your bid has been rejected for project: #{@project.title}."
    redirect_to :back
  end
end
