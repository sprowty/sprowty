class ResumesController < ApplicationController

  def index
  end

  def new
    @resume = current_user.build_resume
  end

  def create
    @resume = Resume.new(params[:resume])
    @resume.user_id = current_user.id
    if @resume.save
      redirect_to root_url, :notice => 'Successfully created your Resume!'
    else
      render :edit
    end
  end

  def edit
    @resume = current_user.resume
  end

  def update
    @resume = current_user.resume
    if @resume.update_attributes(params[:resume])
      redirect_to user_resume_url(current_user.id,@resume), :notice => 'Successfully updated your Resume!'
    else
      render :edit
    end
  end

  def show
    if params[:id].blank?
      redirect_to :action => 'new', :notice => 'You need to create a resume'
    else
      @resume = current_user.resume #Resume.find(params[:id])
    end
  end
end
