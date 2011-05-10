class WorksController < ApplicationController
  
  def create
    @work = current_user.works.new(params[:work])
    
    if @work.save
      redirect_to my_profile_path, :notice => "Added new Work!"
    else
      redirect_to my_profile_path, :notice => "We were unable to add new work, please try again."
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
  
end
