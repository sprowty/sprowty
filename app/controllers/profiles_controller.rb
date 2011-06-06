class ProfilesController < ApplicationController
  
  def index
    @profile  = current_user.profile
    @seeds    = current_user.projects
    @skills   = current_user.skills
    @works    = current_user.works
  end
  
  def new
    render :edit
  end
  
  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to my_profile_url, :notice => 'Successfully updated your Profile!'
    else
      render :edit
    end
  end
  
  def edit
    @profile = current_user.profile
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      redirect_to my_profile_url, :notice => 'Successfully updated your Profile!'
    else
      render :edit
    end
  end
  
  def show
    @user    = User.find_by_id_or_username(params[:id])
    @profile = Profile.find(@user.id)
    @works   = @profile.works
    @skills  = @profile.skills
    @seeds   = @profile.projects
  end
  
end
