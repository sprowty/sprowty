class SkillsController < ApplicationController
  respond_to :html, :json
  
  def create
    @skill = Skill.new(:skill => params[:skill][:skill], :user_id => params[:current_user])
    
    if @skill.save
      render :json => { :status => 'success' }
    else
      render :json => { :status => 'false' }
    end
  end
  
  def destroy
  end
end
