class ProfilesController < ApplicationController
  
  def index
    @profile = current_user.profile
    @seeds   = current_user.projects
    @skills  = current_user.skills
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
    @profile = Profile.find(params[:id])
  end
  
end
