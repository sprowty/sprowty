class FeedbacksController < ApplicationController
  before_filter :require_user
  respond_to :html, :json

  def index
    @feedbacks = current_user.feedbacks
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new
    if @feedback.save
      flash[:notice] = "Feedback sent!"
      render :action => :index
    end
  end
end
