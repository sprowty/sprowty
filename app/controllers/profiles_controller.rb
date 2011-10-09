class ProfilesController < ApplicationController
  before_filter :require_user, :only => [:edit, :update, :destroy]

  def index
    @profile  = current_user.profile
    @seeds    = current_user.projects
    @skills   = current_user.skills
    @works    = current_user.works
    @projects = current_user.projects.where(:approved => true)
  end

  def new
    render :edit
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to profile_rul, :notice => 'Successfully updated your Profile!'
    else
      render :edit
    end
  end

  def edit
    @profile = current_user.profile

  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to profile_url, :notice => 'Successfully updated your Profile!'
    else
      render :edit
    end
  end

  def show
    @profile = params[:id].blank? ? current_user.profile : Profile.find(params[:id])
    @user = @profile.user
    @works   = @profile.works
    @skills  = @profile.skills
    @seeds   = @profile.projects
    params[:id].blank? ? render(:action => :index) : render
  end

  def approve
    @profile = Profile.find(params[:id])
    if @profile.image_approved == true
      @profile.image_approved = false
    else
      @profile.image_approved = true
    end
    @profile.save!
    flash[:notice] = 'Success!'
    redirect_to admin_dashboard_path
  end
end
