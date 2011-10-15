class MessagesController < ApplicationController
  before_filter :require_user
  respond_to :html, :json

  def index
    @messages = current_user.received_messages
    @projects = current_user.projects
  end

  def show
    @projects = current_user.projects
    @message = Message.find(params[:id])
    @sender = User.find(@message.sender_id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build
    @message.to = params[:to]
    @message.subject = params[:subject]
    @message.body = params[:body]
    @message.sender_id = current_user.id
    debugger
    if @message.save
      flash[:notice] = "Message sent!"
      render :action => :index
    end
  end
end
