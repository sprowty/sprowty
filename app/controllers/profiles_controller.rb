class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js

  def index
    @profile  = current_user.profile
    @seeds    = current_user.latest_seeds
    @skills   = current_user.skills
    @works    = current_user.works
    @latest_sprowts = current_user.latest_sprowts
    @current_sprowts = current_user.current_sprowts
    @account  = current_user.account
  end

  def new
    render :edit
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to profile_url, :notice => 'Successfully updated your Profile!'
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
    @account  = @profile.user.account
    @seeds   = @profile.projects
    @latest_sprowts = current_user.latest_sprowts
    @current_sprowts = current_user.current_sprowts
    @feedbacks = @user.feedbacks
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
