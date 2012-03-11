class AdminController < ApplicationController
  respond_to :html, :js

  def index
    @projects = Project.where("sm_state != 'posted'").paginate(:page => params[:page], :per_page => 10)
  end
end
