class WorksController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def create
    @work = current_user.works.new(params[:work])

    if @work.save
      redirect_to profile_path, :notice => "Added new Work!"
    else
      redirect_to profile_path, :notice => "We were unable to add new work, please try again."
    end
  end

  def destroy
    @work = Work.find(params[:id])

    if @work.destroy
      render :json => { :status => 'success' }
    else
      render :json => { :status => 'false' }
    end
  end

  def approve
    @work = Work.find(params[:id])
    if @work.image_approved == true
      @work.image_approved = false
    else
      @work.image_approved = true
    end
    @work.save!
    flash[:notice] = 'Success!'
    redirect_to admin_dashboard_path
  end
end
