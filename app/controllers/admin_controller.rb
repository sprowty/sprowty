class AdminController < ApplicationController
  before_filter :authenticate_admin!
  respond_to :html, :js

  def index
    @projects = Project.where("sm_state != 'posted'").paginate(:page => params[:page], :per_page => 10)
  end
end
