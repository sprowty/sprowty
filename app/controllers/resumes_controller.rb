class ResumesController < ApplicationController

  def index
    @resume = current_user.resume
#    if current_user.resume.blank?
#      flash[:notice] = "You currently have no resume created. Please create one."
#      redirect_to new_user_resume_url(current_user.id)
#    end
  end

  def new
    @resume = current_user.build_resume
  end

  def create
    @resume = Resume.new(params[:resume])
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
    @resume = params[:id] || current_user.resume
  end
end
