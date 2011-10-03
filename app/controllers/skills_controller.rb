class SkillsController < ApplicationController
  respond_to :html, :json
  
  
  
  def create
    @skill = Skill.new(:skill => params[:skill][:skill], :user_id => params[:current_user])
    
    if @skill.save
      render :json => { :status => 'success', :destroy_link => render_to_string(template: 'skills/_delete.html.erb', locals: { skill: @skill })}
    else
      render :json => { :status => 'false' }
    end
  end
  
  def destroy
    @skill = Skill.find(params[:id])
    
    if @skill.destroy
      render :json => { :status => 'success' }
    else
      render :json => { :status => 'false' }
    end
  end
end
